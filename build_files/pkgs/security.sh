#!/bin/bash

set -ouex pipefail

apt -y install apparmor apparmor-profiles apparmor-utils lsb-release wget gnupg
apt -y install firewalld firewall-config

mkdir -p /usr/local/etc/

cp -a /etc/apparmor /usr/local/etc/
cp -a /etc/apparmor.d /usr/local/etc/
