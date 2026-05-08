# Ubuntu Bootc Remix

Unofficial ready-to-use Atomic Ubuntu OS

`ghcr.io/jumpyvi/ubuntu-bootc-remix:latest-amd64`


> Until upstream bugs are fixed in 7.0, this will use XanMod's LTS


# Features
- Based on latest Ubuntu
- Minimal Ubuntu Desktop
- Auto-Updates with uupd
- All the packages (Brew, Flatpak and Snaps)
- Firmwares and codecs ootb (for amd/intel)
- TPM/LUKS/Systemd-homed support
- Built for amd64v3 **only**
- UFW/apparmor enabled

## Building

In order to get a running debian-bootc system you can run the following steps:
```shell
just build-containerfile # This will build the containerfile and all the dependencies you need
just generate-bootable-image # Generates a bootable image for you using bootc!
```

Then you can run the `bootable.img` as your boot disk in your preferred hypervisor.


# Thanks & friends

- Based on the work from <https://github.com/bootcrew/mono>
- [Zirconium](https://github.com/zirconium-dev/zirconium)
- [ApolloLinux](https://github.com/apollo-linux/apollo)