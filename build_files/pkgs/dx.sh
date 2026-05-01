#!/bin/bash

set -ouex pipefail

apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst qemu-system cpu-checker

apt install -y podman rsync rclone git
