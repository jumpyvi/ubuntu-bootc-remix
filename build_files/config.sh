#!/bin/bash

set -ouex pipefail

/ctx/pkgs/networking.sh
/ctx/pkgs/uupd.sh
/ctx/pkgs/security.sh
/ctx/pkgs/dx.sh
/ctx/pkgs/snap.sh
