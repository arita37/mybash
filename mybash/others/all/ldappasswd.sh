#!/bin/bash

# Script asks user about his password, encrypts this password using SHA-256 algorithm 
# adds salt and writes this salted hash to the "userPassword" attribute of user's object 
# in LDAP, to make this hash work LDAP uses capabilities of OS and crypt package.  

# Usage:
# ldappasswd_domain.sh [name]
#

# Exit  immediately  if a pipeline, exits with a non-zero status
set -e

USERNAME=""
SHOWHELP=0

# Tests whether argument of user name was added to the script.
while test -n "${1}"; do
  if test "${1}" = "-h"; then
    SHOWHELP=1;
  else
    USERNAME="${1}"
  fi;
    shift;
done

if test -z "${USERNAME}" -o $SHOWHELP -eq 1; then
  echo "Usage:  ldappasswd_domain.sh [-h] username"
  echo " -h: show this help"
  exit 1
fi

# Declare global variables.
BASE="dc=ng,dc=domain,dc=com"
PARMS="-x -D cn=admin,"${BASE}" -w snZxmbr4jjUD"
TMPF="$(mktemp)"


# Function which will be called when user has "userPassword" attribute  and it 
# needs to be removed before adding new one.
delete_attribute() {
DELETE_PASSWORD_LDIF="$(mktemp)"

cat > "${DELETE_PASSWORD_LDIF}" <<EOM
dn: uid=${USERNAME},ou=People,dc=ng,dc=domain,dc=com
changetype: modify
delete: userPassword
EOM

grep -A 1 'userPassword' ${TMPF} >> "${DELETE_PASSWORD_LDIF}"
ldapmodify ${PARMS} -f "$DELETE_PASSWORD_LDIF"
if [ $? -eq 0 ]; then
  echo "The 'userPassword' attribute was removed successfully !"
  echo "========================================================"
  echo "               "
  echo "Enter new password ..."
else
  echo "The 'userPassword' attribute was not removed, something went wrong, please troubleshoot situation"
  exit 1
fi
# cat "${DELETE_PASSWORD_LDIF}"
rm "${DELETE_PASSWORD_LDIF}"
}

# Function adds "userPassword" attribute but encrypts it before.
add_attribute() {
read -s -p "Password: " USER_PASSWORD
USER_PASSWORD_CHECK="$(cracklib-check <<<"$USER_PASSWORD")"
if [[ `awk -F': ' '{ print $2}' <<<"$USER_PASSWORD_CHECK"` == "OK" ]]
then
  echo "       "
  read -s -p "Enter password one more time: " USER_PASSWORD_CONFIRM
  echo "    "
  if [ $USER_PASSWORD != $USER_PASSWORD_CONFIRM ]; then
    echo "Passwords don't match ! "
    exit 1
  fi
else
  echo " The password - $USER_PASSWORD_CHECK" 
  exit 1
fi
RANDOM_SALT=$(head -c 40 /dev/random | base64 | sed -e 's/+/./g' |  cut -b 10-25)
HASHED_PASSWORD=$(mkpasswd --rounds 500000 -m sha-256 --salt ${RANDOM_SALT} "$USER_PASSWORD")

ADD_PASSWORD_LDIF="$(mktemp)"
cat > "${ADD_PASSWORD_LDIF}" <<EOM
dn: uid=${USERNAME},ou=People,dc=ng,dc=domain,dc=com
changetype: modify
add: userPassword
userPassword: {CRYPT}${HASHED_PASSWORD}
EOM

ldapmodify ${PARMS} -f "$ADD_PASSWORD_LDIF"
if [ $? -eq 0 ]; then
  echo "The 'userPassword' attribute was added successfully !"
else
  echo "The 'userPassword' attribute was not added, something went wrong, please troubleshoot situation"
  exit 1
fi
#cat ${ADD_PASSWORD_LDIF}
rm ${ADD_PASSWORD_LDIF}

}

# Main body of script
ldapsearch ${PARMS} -b "ou=People,${BASE}" uid=${USERNAME} > "${TMPF}"

if grep 'userPassword' ${TMPF}; then
  echo "                     "
  echo "============================================================="
  echo "'userPassword' attribute already exists for the - ${USERNAME}"
  read -p "Do you want to change password, or you prefer to leave the old one? ([Y]es, [N]o, default=[N]o-leave the old one): " CHANGE_PASS
  if [[ "${CHANGE_PASS}" =~ ^(Y|y|Yes|yes)$ ]]; then
    true
  else
    exit 1
  fi

  delete_attribute
  add_attribute

else
  add_attribute
fi
#cat "${TMPF}"
rm "${TMPF}"
