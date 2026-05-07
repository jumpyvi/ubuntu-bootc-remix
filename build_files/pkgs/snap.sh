#!/bin/bash

set -ouex pipefail

apt-get install -y snapd

systemctl enable snap.mount