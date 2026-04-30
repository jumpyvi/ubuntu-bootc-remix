FROM docker.io/library/debian:sid

ARG DEBIAN_FRONTEND=noninteractive

RUN --mount=type=tmpfs,dst=/tmp --mount=type=tmpfs,dst=/root --mount=type=tmpfs,dst=/boot \
    apt-get update -y && \
    apt-get -y install ca-certificates curl gpg lsb-release && \
    mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://dl.xanmod.org/archive.key | gpg --dearmor -vo /etc/apt/keyrings/xanmod-archive-keyring.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/xanmod-archive-keyring.gpg] http://deb.xanmod.org $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/xanmod-release.list && \
    apt-get update -y && \
    apt-get install -y linux-xanmod-lts-x64v3 scx-scheds clang libelf-dev lld llvm && \
    apt-get install -y btrfs-progs dosfstools e2fsprogs fdisk firmware-linux-free skopeo systemd systemd-boot* xfsprogs && \
    cp /boot/vmlinuz-* "$(find /usr/lib/modules -maxdepth 1 -type d | tail -n 1)/vmlinuz" && \
    apt-get clean -y

# Setup a temporary root passwd (changeme) for dev purposes
# RUN apt-get update -y && apt-get install -y whois
# RUN usermod -p "$(echo "changeme" | mkpasswd -s)" root

ENV CARGO_HOME=/tmp/rust
ENV RUSTUP_HOME=/tmp/rust
RUN --mount=type=tmpfs,dst=/tmp --mount=type=tmpfs,dst=/root --mount=type=tmpfs,dst=/boot \
    apt-get update -y && \
    apt-get install -y git curl make build-essential go-md2man libzstd-dev pkgconf dracut libostree-dev ostree && \
    curl --proto '=https' --tlsv1.2 -sSf "https://sh.rustup.rs" | sh -s -- --profile minimal -y && \
    git clone "https://github.com/bootc-dev/bootc.git" /tmp/bootc && \
    sh -c ". ${RUSTUP_HOME}/env ; make -C /tmp/bootc bin install-all" && \
    printf "systemdsystemconfdir=/etc/systemd/system\nsystemdsystemunitdir=/usr/lib/systemd/system\n" | tee "/usr/lib/dracut/dracut.conf.d/30-bootcrew-fix-bootc-module.conf" && \
    printf 'reproducible=yes\nhostonly=no\ncompress=zstd\nadd_dracutmodules+=" bootc "' | tee "/usr/lib/dracut/dracut.conf.d/30-bootcrew-bootc-container-build.conf" && \
    dracut --force "$(find /usr/lib/modules -maxdepth 1 -type d | tail -n 1)/initramfs.img" && \
    apt-get purge -y git make build-essential go-md2man libzstd-dev pkgconf libostree-dev && \
    apt-get autoremove -y && \
    apt-get clean -y

RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://pkgs.tailscale.com/stable/debian/sid.noarmor.gpg | tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null && \
    curl -fsSL https://pkgs.tailscale.com/stable/debian/sid.tailscale-keyring.list | tee /etc/apt/sources.list.d/tailscale.list && \
    #
    apt-get update && apt-get install --fix-missing -y \
    sudo sudo-rs vim podman network-manager apparmor apparmor-profiles apparmor-utils flatpak distrobox \
    cups hplip tailscale \
    libgl1-mesa-dri mesa-vulkan-drivers libegl-mesa0 libglx-mesa0 \
    gnome-core gnome-initial-setup && \
    #
    systemctl enable gdm && \
    apt-get remove -y gnome-software packagekit firefox-esr showtime gnome-maps snapshot simple-scan gnome-connections gnome-contacts gnome-calculator gnome-clocks gnome-weather \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Necessary for general behavior expected by image-based systems
RUN sed -i 's|^HOME=.*|HOME=/var/home|' "/etc/default/useradd" && \
    rm -rf /boot /home /root /usr/local /srv /var && \
    mkdir -p /sysroot /boot /usr/lib/ostree /var && \
    ln -s sysroot/ostree /ostree && ln -s var/roothome /root && ln -s var/srv /srv && ln -s var/opt /opt && ln -s var/mnt /mnt && ln -s var/home /home && \
    echo "$(for dir in opt home srv mnt usrlocal ; do echo "d /var/$dir 0755 root root -" ; done)" | tee -a "/usr/lib/tmpfiles.d/bootc-base-dirs.conf" && \
    printf "d /var/roothome 0700 root root -\nd /run/media 0755 root root -" | tee -a "/usr/lib/tmpfiles.d/bootc-base-dirs.conf" && \
    printf '[composefs]\nenabled = yes\n[sysroot]\nreadonly = true\n' | tee "/usr/lib/ostree/prepare-root.conf"

# https://bootc-dev.github.io/bootc/bootc-images.html#standard-metadata-for-bootc-compatible-images
LABEL containers.bootc 1

RUN bootc container lint