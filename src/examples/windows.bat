@ECHO OFF

SETLOCAL EnableExtensions

SET CAD_PSCPEXE="C:\Program Files\pscp.exe"
SET CAD_KEYFILE="C:\Users\My Username\Desktop\crypto_keyfile.bin"
SET CAD_USERNAME=root
SET CAD_TARGET_HOST=192.168.111.100
SET CAD_TARGET_KNOCK_PORT=2256
SET CAD_TARGET_PATH=/
SET CAD_PUTTY_PROFILE=my-server

REM Knock on port <CAD_TARGET_KNOCK_PORT> to prepare knockencryptssh
SET CAD_WINDOW_TITLE="TelnetPortKnockForKnockEncryptSSH-%RANDOM%"
START /B /WAIT "%CAD_WINDOW_TITLE%" telnet %CAD_TARGET_HOST% %CAD_TARGET_KNOCK_PORT% >NUL 2>&1
taskkill /FI "WINDOWTITLE eq %CAD_WINDOW_TITLE%" /T /F >NUL 2>&1

REM Sleep a second so the shell can be switched
ping -n 1 127.0.0.1 >NUL 2>&1

REM Transmit the keyfile and by connecting fulfil the knock procedure
START /WAIT %CAD_PSCPEXE% -scp -agent -load %CAD_PUTTY_PROFILE% %CAD_KEYFILE% %CAD_USERNAME%@%CAD_TARGET_HOST%:%CAD_TARGET_PATH%

ENDLOCAL