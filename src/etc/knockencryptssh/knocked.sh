#!/bin/bash


KES_TEMPDIR="/tmp/knockencryptssh_initrd"


if [ "${1}" == "keyfile" -o "${1}" == "passphrase" ]
then
    ([ -d "${KES_TEMPDIR}" ] || mkdir -p "${KES_TEMPDIR}" ) && touch "${KES_TEMPDIR}/knockencryptssh.${1}"
fi
