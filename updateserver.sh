#!/bin/bash

# Github: Addereum
# Github.com/Addereum
# CS2-InstallScript

source variables.sh

# Reset
Color_Off='\033[0m'       # Text Reset

BGreen='\033[1;32m'       # Green
Green='\033[0;32m'        # Green
Red='\033[0;31m'          # Red

if [ -n "$steamloginname" ] && [ -n "$steamloginpassword" ]
then
    if [ -n "$installdir" ]
    then
        echo -e "updating server to \n${BGreen}$installdir ${Color_Off}"
        sudo /usr/games/steamcmd +force_install_dir "$installdir" +login "$steamloginname" "$steamloginpassword" +app_update 730 +quit
        echo -e "updated server"
    else
        echo -e "${Red}No directory provided ${Color_Off}"
    fi
else
    echo -e "${Red}No Login Specified ${Color_Off}"
fi