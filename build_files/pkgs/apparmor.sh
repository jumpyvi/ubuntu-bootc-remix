#!/bin/bash

set -ouex pipefail

apt-get install -y lsb-release wget gnupg

apt-get update

apt -y install apparmor apparmor-profiles apparmor-utils 


mkdir -p /usr/lib/bootc/kargs.d/
mkdir -p /etc/systemd/system/apparmor.service.d/
mkdir -p /etc/apparmor/earlypolicy/

mkdir -p /usr/local/etc/

cp -r /etc/apparmor* /usr/local/etc/

printf 'kargs = ["apparmor=1", "lsm=lockdown,yama,apparmor"]\n' > /usr/lib/bootc/kargs.d/10-apparmor.toml
printf '[Unit]\nConditionSecurity=\n' > /etc/systemd/system/apparmor.service.d/override.conf

#echo 'write-cache' | tee -a /etc/apparmor/parser.conf
#echo 'cache-loc /etc/apparmor/earlypolicy/' | tee -a /etc/apparmor/parser.conf
#echo 'Optimize=compress-fast' | tee -a /etc/apparmor/parser.conf

systemctl enable apparmor.service
