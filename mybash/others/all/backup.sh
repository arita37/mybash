#!/usr/bin/env bash
set -e
set -o pipefail

GLUSTERFS_MOUNT_VOL='acb401.analysis-shared.jpe2b.dcnw.zzz:/sssvols06'
GLUSTERFS_BACKUP_SERVERS='acb402.analysis-shared.jpe2b.dcnw.zzz:acb403.analysis-shared.jpe2b.dcnw.zzz'
GLUSTERFS_MOUNT_POINT='/a/backup_vol'


log() {
   echo "$(date "+%Y-%m-%d %T") : $1"
}

run_as_ppp() {
    setpriv --regid=ppp --reuid=ppp --init-groups ${@}
}

mount_gluster() {
    log "mounting glusterFS volume ${GLUSTERFS_MOUNT_VOL}"
    mkdir -p "${GLUSTERFS_MOUNT_POINT}"
    mount -t glusterfs \
          -o log-level=WARNING,backup-volfile-servers=${GLUSTERFS_BACKUP_SERVERS} \
          "${GLUSTERFS_MOUNT_VOL}" "${GLUSTERFS_MOUNT_POINT}"

    mkdir -p ${GLUSTERFS_MOUNT_POINT}/${backup_dir}
    chown -R ppp:ppp ${GLUSTERFS_MOUNT_POINT}/${backup_dir}
}

backup_database() {
    backup_file="${GLUSTERFS_MOUNT_POINT}/${backup_dir}/${1}.$(date '+%Y%m%d').gz"

    run_as_ppp \
        /usr/bin/pg_dump --no-password --dbname="${1}" \
            --host="${db_host}" --port="${db_port}" \
            --username="${db_user}" | gzip > ${backup_file}

    chown ppp:ppp ${backup_file}
    if [[ ! -s $backup_file ]]; then
        log "Error: Empty backup for DB ${1}"
        exit 1
    fi
}

backup_globals() {
    backup_file="${GLUSTERFS_MOUNT_POINT}/${backup_dir}/globals.$(date '+%Y%m%d').gz"

    run_as_ppp \
        /usr/bin/pg_dumpall --no-password --globals-only \
        --host="${db_host}" --port="${db_port}" \
        --username="${db_user}"| gzip > ${backup_file}

    chown ppp:ppp ${backup_file}
    if [[ ! -s $backup_file ]]; then
        log "Error: Empty backup for globals"
        exit 2
    fi
}

backup_all() {
    log 'Backing up globals'
    backup_globals

    for database in "${databases[@]}"; do
        log "Backing up ${database}"
        backup_database ${database}
    done
}

rotate() {
    find "${GLUSTERFS_MOUNT_POINT}/${backup_dir}" \
        -type f \
        -name "*.gz" \
        -mtime "${retention_threshold}" \
        -exec echo removing {} \; -exec rm -f {} \;
}


usage() {
    echo "Usage ${0} -H {db host} -P {db_port} -U {db_user} -D [databases] -b {backup_directory} -t {retention_threshold(days)}"
}

while getopts "H:P:U:D:b:t:h" option; do
    case "${option}" in
        H)
            db_host=${OPTARG}
            ;;
        U)
            db_user=${OPTARG}
            ;;
        P)
            db_port=${OPTARG}
            ;;
        D)
            databases+=("$OPTARG")
            ;;
        b)
            backup_dir=${OPTARG}
            ;;
        t)
            retention_threshold=${OPTARG}
            ;;
        h)
            usage; exit 0
            ;;
        *)
            echo "unknown option ${option}"
            usage; exit 1
            ;;
    esac
done

if [ -z "${db_host}" ] || [ -z "${db_user}" ] || [ -z "${db_port}" ]; then
    log 'Missing DB args'; usage; exit 3
fi

if [ -z "${backup_dir}" ] || [ -z "${retention_threshold}" ]; then
    log 'Missing backup args'; usage; exit 4
fi

if [ -z "${databases}" ]; then
    log 'No backup databases specified, will only backup globals'
fi

log "Database : ${db_user}@${db_host}:${db_port}"
log "Backup Location : ${GLUSTERFS_MOUNT_POINT}/${backup_dir}"
log "Backup Databases : ${databases[*]}"
log "Retention Threshold : ${retention_threshold} days"

printf "\n"
mount_gluster
backup_all

printf "\n"
rotate

log "Finished"
