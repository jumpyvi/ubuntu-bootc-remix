Based on the work from <https://github.com/bootcrew/mono>

# Bunny

Minimal ubuntu-bootc OS


# Features
- Based on latest Ubuntu (stuck on Questing for now)
- Ubuntu bloat removed (No snaps, default apps)
- Ublue-like tools (brew, uupd, flatpaks)
- Firmwares and codecs ootb (for amd/intel)
- TPM/LUKS/Systemd-homed support

## Building

In order to get a running debian-bootc system you can run the following steps:
```shell
just build-containerfile # This will build the containerfile and all the dependencies you need
just generate-bootable-image # Generates a bootable image for you using bootc!
```

Then you can run the `bootable.img` as your boot disk in your preferred hypervisor.
