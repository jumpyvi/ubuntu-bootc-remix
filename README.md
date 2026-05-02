Based on the work from <https://github.com/bootcrew/mono>


# Features
- Based on latest Debian sid
- Super minimal gnome install
- Default Ubuntu kernel
- Apparmor.d
- Ublue-like tools (brew, uupd, flatpaks)
- Firmwares and codecs ootb (for amd/intel)
- TPM/LUKS/Systemd-homed support

# Microb

Minimal debian-bootc OS

<img width="2196" height="1239" alt="image" src="https://github.com/user-attachments/assets/0b031de0-5593-49e8-8e5a-535ebdcf46e3" />

## Building

In order to get a running debian-bootc system you can run the following steps:
```shell
just build-containerfile # This will build the containerfile and all the dependencies you need
just generate-bootable-image # Generates a bootable image for you using bootc!
```

Then you can run the `bootable.img` as your boot disk in your preferred hypervisor.
