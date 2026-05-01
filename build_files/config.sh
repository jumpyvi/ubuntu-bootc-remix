#!/bin/bash

set -ouex pipefail

./pkgs/uupd.sh
./pkgs/apparmor.sh