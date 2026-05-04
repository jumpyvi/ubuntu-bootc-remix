
#!/bin/bash

set -ouex pipefail

curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/questing.noarmor.gpg | tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null && \
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/questing.tailscale-keyring.list | tee /etc/apt/sources.list.d/tailscale.list

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
    tailscale \
    wireguard \
    wireguard-tools





#install -Dm644 /dev/stdin /etc/hosts <<'EOF'
#127.0.0.1   localhost
#::1         localhost
#EOF

#ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
