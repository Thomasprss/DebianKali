#!/bin/bash

## Install paquage system

IP=$(hostname -I | awk '{print $2}')
APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"

echo "START - debian configuration as a kali - "$IP

apt-get install $APT_OPT \
	curl wget gnupg2 \
	software-properties-common \
	nmap \
	ettercap-common \
	wfuzz \


echo "[2] install metaqploit... "
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod +x msfinstall
./msfinstall




