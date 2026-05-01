#!/bin/bash

set -ouex pipefail

apt-get install -y sudo-rs hx

mkdir -p /usr/local/bin/
ln -sf /usr/bin/sudo-rs /usr/local/bin/sudo

ln -sf /usr/bin/hx /usr/local/bin/vim
ln -sf /usr/bin/hx /usr/local/bin/vi