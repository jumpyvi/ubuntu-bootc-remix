#!/bin/bash

set -ouex pipefail

apt -y install apparmor apparmor-profiles apparmor-utils lsb-release wget gnupg

mkdir -p /usr/local/etc/

cp -a /etc/apparmor /usr/local/etc/
cp -a /etc/apparmor.d /usr/local/etc/

rm -rf /etc/apparmor /etc/apparmor.d

ln -s /usr/local/etc/apparmor /etc/apparmor
ln -s /usr/local/etc/apparmor.d /etc/apparmor.d
