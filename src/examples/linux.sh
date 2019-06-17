#!/bin/bash

local CAD_KEYFILE=/home/my-username/crypto_keyfile.bin
local CAD_USERNAME=root
local CAD_TARGET_HOST=192.168.111.100
local CAD_TARGET_KNOCK_PORT=2256
local CAD_TARGET_SCP_PORT=2255
local CAD_TARGET_SCP_PATH=/

# Knock on port <CAD_TARGET_KNOCK_PORT> to prepare knockencryptssh
telnet "${CAD_TARGET_HOST}" "${CAD_TARGET_KNOCK_PORT}" >/dev/null 2>&1

# Sleep a second so the shell can be switched
sleep 1

# Transmit the keyfile and by connecting fulfil the knock procedure
scp -p "${CAD_TARGET_SCP_PORT}" "${CAD_KEYFILE}" "${CAD_USERNAME}@${CAD_TARGET_HOST}:${CAD_TARGET_SCP_PATH}"
