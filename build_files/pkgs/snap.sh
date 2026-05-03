#!/bin/bash

set -ouex pipefail

apt-get install -y snapd

cat > /usr/lib/systemd/system/snap.mount << 'EOF'
[Unit]
Description=Bind /var/lib/snapd/snap → /snap
DefaultDependencies=no
After=local-fs-pre.target
Before=local-fs.target snapd.service snapd.socket

[Mount]
What=/var/lib/snapd/snap
Where=/snap
Type=none
Options=bind

[Install]
WantedBy=local-fs.target
EOF


systemctl enable snap.mount \
    snapd.apparmor.service \
    snapd.service \
    snapd.socket