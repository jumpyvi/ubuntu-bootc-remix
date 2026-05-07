Based on the work from <https://github.com/bootcrew/mono>

# Bunny

Minimal ubuntu-bootc OS


# Features
- Based on latest Ubuntu (stuck on Questing for now)
- Minimal Ubuntu Desktop
- Auto-Updates with uupd
- All the packages (Brew, Flatpak and Snaps)
- Firmwares and codecs ootb (for amd/intel)
- TPM/LUKS/Systemd-homed support
- Built for amd64v3 **only**
- Firewalld/apparmor enabled

## Building

In order to get a running debian-bootc system you can run the following steps:
```shell
just build-containerfile # This will build the containerfile and all the dependencies you need
just generate-bootable-image # Generates a bootable image for you using bootc!
```

Then you can run the `bootable.img` as your boot disk in your preferred hypervisor.
