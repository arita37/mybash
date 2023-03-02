#!/bin/bash

mkdir -p \
tttgfs101/sssvolh01 \
tttgfs201/sssvols02 \
tttcb201/sssvols03 \
tttcb301/sssvols05 \
/dd/101/sssvols07

# Unsecured
mv /var/lib/glusterd/secure-access /var/lib/glusterd/secure-access.sav
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs102.nnn.hnd1..local:gfs103.nnn.hnd1..local gfs101.nnn.hnd1..local:/sssvolh01 tttgfs101/sssvolh01
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs202.nnn.hnd1..local:gfs203.nnn.hnd1..local gfs201.nnn.hnd1..local:/sssvols02 tttgfs201/sssvols02
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb202.nnn.hnd2..local:cb203.nnn.hnd2..local cb201.nnn.hnd2..local:/sssvols03 tttcb201/sssvols03
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=cb302.nnn.hnd2..local:cb303.nnn.hnd2..local cb301.nnn.hnd2..local:/sssvols05 tttcb301/sssvols05

# Secured
mv /var/lib/glusterd/secure-access.sav /var/lib/glusterd/secure-access
mount -t glusterfs -o log-level=WARNING,backup-volfile-servers=gfs102.aog.jpe2b.dcnw.zzz:gfs103.aog.jpe2b.dcnw.zzz gfs101.aog.jpe2b.dcnw.zzz:/sssvols07 /dd/101/sssvols07

