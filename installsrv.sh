#!/bin/bash

# Eingabeaufforderung anzeigen und Benutzereingabe in eine Variable speichern
read -p "Please enter your Steam login name: " steamloginname
if [ -z "$steamloginname" ]; then
    echo "The Steam login name cannot be empty."
    exit 1  # Exit script with an error code
fi

read -p "Please enter your account password: " steamloginpassword
if [ -z "$steamloginpassword" ]; then
    echo "The password cannot be empty."
    exit 1  # Exit script with an error code
fi

read -p "Please enter an installation folder: " installdir
if [ -z "$installdir" ]; then
    echo "The entry for the installation folder cannot be empty."
    exit 1  # Exit script with an error code
fi

#read -p "Do you want to install the server? (Yes No): " choice

# Die eingegebenen Variablen in eine andere Datei umleiten
echo "export steamloginname=\"$steamloginname\"" > variables.sh
echo "export steamloginpassword=\"$steamloginpassword\"" >> variables.sh
echo "export installdir=\"$installdir\"" >> variables.sh

# Bestätigungsnachricht ausgeben
echo "Your login will be saved in 'variables.sh'."

# Ask user if they would like to install the server directly
read -p "Do you want to install the server? (Yes No): " choice

# Check if the user input is "yes".
if [ "$choice" == "Yes" ]; then
    echo "Installation is starting..."
    sudo ./updateserver.sh
else
    echo "Server installation was aborted. To start, run sudo ./updateserver "
fi
