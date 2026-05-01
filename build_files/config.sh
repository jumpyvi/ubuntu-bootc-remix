#!/bin/bash

set -ouex pipefail

/ctx/pkgs/uupd.sh
/ctx/pkgs/apparmor.sh
/ctx/pkgs/utils.sh
/ctx/pkgs/dx.sh
