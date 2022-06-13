#!/bin/bash

## Install paquage system

IP=$(hostname -I | awk '{print $2}')
APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"

echo "START - debian configuration as a kali - "$IP

echo "[1] install nmap, wfuzz, ettercap..."
apt-get install $APT_OPT \
	curl wget gnupg2 \
	software-properties-common \
	nmap \
	ettercap-common \
	wfuzz \

echo "[2] install metasploit... "
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod +x msfinstall
./msfinstall

echo "[3] install wireshark... "
echo "wireshark-common wireshark-common/install-setuid boolean true" | debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt-get -y install wireshark >> /dev/null

