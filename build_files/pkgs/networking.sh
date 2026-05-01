
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
    nm-connection-editor



install -Dm644 /dev/stdin /etc/hosts <<'EOF'
127.0.0.1   localhost
::1         localhost
EOF

ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf