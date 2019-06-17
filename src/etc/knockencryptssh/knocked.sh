#!/bin/bash

declare -A KES_CONF
OLDIFS="${IFS}"
while IFS='=' read -r key value; do KES_CONF[$key]="$value"; done < <(awk '/^\[/ { section=substr($0, 2, length - 2) } /=/ { print section "." $0 }' /etc/knockencryptssh/knockencryptssh.conf)
IFS="${OLDIFS}"

if [ ( "${1}" == "keyfile" -o "${1}" == "passphrase" ) -a "x${KES_CONF[knockencryptssh.tempdir]}" != "x" ]
then
    ([ -d "${KES_CONF[knockencryptssh.tempdir]}" ] || mkdir -p "${KES_CONF[knockencryptssh.tempdir]}" ) && touch "${KES_CONF[knockencryptssh.tempdir]}/knockencryptssh.${1}"
fi
