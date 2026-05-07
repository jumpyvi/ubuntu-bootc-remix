
#!/bin/bash

set -ouex pipefail

apt-get update && apt-get install -y \
    systemd-resolved \
    network-manager \
    network-manager-openconnect-gnome \
    network-manager-openvpn-gnome \
    network-manager-ssh-gnome \
    network-manager-sstp-gnome \
    network-manager-vpnc-gnome \
    openssh-server \
    iputils-ping \
    gcr \
    nm-connection-editor \
    wireguard \
    wireguard-tools