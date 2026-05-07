#!/bin/bash

set -ouex pipefail

rm -rf /boot /home /root /srv /var /media && \
mkdir -p \
/sysroot /boot /usr/lib/ostree /var \
/home /root /srv /opt /mnt \
/snap && \
ln -s sysroot/ostree /ostree && \
ln -s run/media /media

systemctl enable home.mount mnt.mount opt.mount root.mount srv.mount