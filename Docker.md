## Docker for M1

https://blog.carlosnunez.me/post/docker-desktop-alternative-for-mac/

Add to the `.bash_profile`

```sh
export DOCKER_DEFAULT_PLATFORM="linux/arm64"
```

```sh
brew install lima docker
limactl --version
.
limactl version 0.11.1
```

```sj
mkdir $HOME/lima_machines
curl -sSLo $HOME/lima_machines/docker.yaml https://raw.githubusercontent.com/carlosonunez/bash-dotfiles/main/lima_machine.yaml
cat $HOME/lima_machines/docker.yaml
```

`$HOME/lima_machines/docker.yaml`

```yaml
arch: default
images:
  - location: "~/Downloads/impish-server-cloudimg-amd64.img"
    arch: "x86_64"
  - location: "~/Downloads/impish-server-cloudimg-arm64.img"
    arch: "aarch64"
  - location: https://github.com/lima-vm/alpine-lima/releases/download/v0.2.0/alpine-lima-rd-3.13.5-aarch64.iso
    arch: "aarch64"
    digest: "sha512:59c2dc5257be4d7dd05de6c64fcebae710f4e6eb993c784379a562be290cc957d5c8f2aef0d4c0c90a6fae5991218771e60e37a40a15414d2c169a6fdf534185"
  - location: https://github.com/lima-vm/alpine-lima/releases/download/v0.2.0/alpine-lima-rd-3.13.5-x86_64.iso
    arch: "x86_64"
    digest: "sha512:73953b3f4e9dee279b058f51b323e430697d2e305b391d997046c3ef0468a6cb7f445144653d297c68cd294d4d0264e01bed114fc3555501b3a733759505f929"
cpus: 4
memory: 8GiB
disk: 50GiB
useHostResolver: false
dns:
  - 8.8.8.8
  - 4.4.4.4
mounts:
  - location: "~/src"
    writable: true
  - location: "~/tmp"
    writable: true

  # NOTE: Replace %TEMPDIR% with your actual temporary directory as provided by
  # the $TMPDIR environment variable.
  - location: "%TEMPDIR%"
    writable: true
  - location: "/tmp/lima"
    writable: true
  - location: "~/.config"
    writable: true
  - location: "~/.lima"
    writable: false
ssh:
  localPort: 10000
  loadDotSSHPubKeys: true
  forwardAgent: false
containerd:
  system: false
  user: false
provision:
  - mode: system
    script: |
      #!/bin/bash
      set -eux -o pipefail
      # Add our user into the 'docker' group so that we don't have to sudo
      usermod -aG docker $LIMA_CIDATA_USER

      # Start Docker
      /etc/init.d/docker start

      # Fix clock drift by syncing with host
      max_attempts=5
      attempts=0
      until docker run --rm --privileged alpine hwclock -s
      do
        attempts=$((attempts+1))
        echo "WARNING: Unable to sync clock with host; trying again in 1 second"
        sleep 1
      done

      # Enable multi-arch support
      # If you need support for other architectures like s90x or PPC,
      # run the command below manually and provide the target arch at the end
      if uname -m | grep -Eiq 'aarch|arm'
      then docker run --rm --privileged aptman/qus -s -- -p x86_64
      else docker run --rm --privileged aptman/qus -s -- -p arm
      fi

      # Add a cron job to keep the time synced up
      echo 'ntpd -d -q -n -p pool.ntp.org' > /etc/periodic/15min/sync-the-time
      chmod +x /etc/periodic/15min/sync-the-time

probes:
  - script: |
      #!/bin/bash
      set -eux -o pipefail
      if ! timeout 30s bash -c "until command -v docker ps >/dev/null 2>&1; do sleep 3; done"; then
        echo >&2 "docker is not installed yet"
        exit 1
      fi
    hint: See "/var/log/cloud-init-output.log". in the guest
firmware:
  legacyBIOS: true
video:
  display: "none"
propagateProxyEnv: true
portForwards:
  - guestSocket: "/var/run/docker.sock"
    hostSocket: "{{.Home}}/.lima/docker.sock"
```

```sh
echo $TMPDIR
.
/var/folders/33/252wsk096cz98y46v0cwwjfh0000gp/T/
```

```sh
subl $HOME/lima_machines/docker.yaml
```

Replace %TMPDIR% with value output by the $TMPDIR environment variable.

Now can start the Docker VM

```sh
limactl start $HOME/lima_machines/docker.yaml --tty=false
.
INFO[0000] Terminal is not available, proceeding without opening an editor
INFO[0000] Attempting to download the image from "~/Downloads/impish-server-cloudimg-arm64.img"  digest=
INFO[0000] Attempting to download the image from "https://github.com/lima-vm/alpine-lima/releases/download/v0.2.0/alpine-lima-rd-3.13.5-aarch64.iso"  digest="sha512:59c2dc5257be4d7dd05de6c64fcebae710f4e6eb993c784379a562be290cc957d5c8f2aef0d4c0c90a6fae5991218771e60e37a40a15414d2c169a6fdf534185"
149.82 MiB / 149.82 MiB [----------------------------------] 100.00% 25.76 MiB/s
INFO[0007] Downloaded the image from "https://github.com/lima-vm/alpine-lima/releases/download/v0.2.0/alpine-lima-rd-3.13.5-aarch64.iso"
WARN[0007] [hostagent] local user "user.name" is not a valid Linux username (must match "^[a-z_][a-z0-9_-]*$"); using "lima" username instead
WARN[0007] [hostagent] field `firmware.legacyBIOS` is not supported for architecture "aarch64", ignoring
INFO[0007] [hostagent] Starting QEMU (hint: to watch the boot progress, see "/Users/user.name/.lima/docker/serial.log")
INFO[0007] SSH Local Port: 10000
INFO[0007] [hostagent] Waiting for the essential requirement 1 of 5: "ssh"
INFO[0038] [hostagent] Waiting for the essential requirement 1 of 5: "ssh"
INFO[0038] [hostagent] The essential requirement 1 of 5 is satisfied
INFO[0038] [hostagent] Waiting for the essential requirement 2 of 5: "user session is ready for ssh"
INFO[0038] [hostagent] The essential requirement 2 of 5 is satisfied
INFO[0038] [hostagent] Waiting for the essential requirement 3 of 5: "sshfs binary to be installed"
INFO[0038] [hostagent] The essential requirement 3 of 5 is satisfied
INFO[0038] [hostagent] Waiting for the essential requirement 4 of 5: "/etc/fuse.conf (/etc/fuse3.conf) to contain \"user_allow_other\""
INFO[0038] [hostagent] The essential requirement 4 of 5 is satisfied
INFO[0038] [hostagent] Waiting for the essential requirement 5 of 5: "the guest agent to be running"
INFO[0039] [hostagent] The essential requirement 5 of 5 is satisfied
INFO[0039] [hostagent] Mounting "/Users/user.name/src" on "/Users/user.name/src"
INFO[0039] [hostagent] Mounting "/Users/user.name/tmp" on "/Users/user.name/tmp"
INFO[0039] [hostagent] Mounting "/var/folders/33/252wsk096cz98y46v0cwwjfh0000gp/T" on "/var/folders/33/252wsk096cz98y46v0cwwjfh0000gp/T"
INFO[0039] [hostagent] Mounting "/tmp/lima" on "/tmp/lima"
INFO[0039] [hostagent] Mounting "/Users/user.name/.config" on "/Users/user.name/.config"
INFO[0040] [hostagent] Mounting "/Users/user.name/.lima" on "/Users/user.name/.lima"
INFO[0040] [hostagent] Waiting for the optional requirement 1 of 1: "user probe 1/1"
INFO[0040] [hostagent] Forwarding "/var/run/docker.sock" (guest) to "/Users/user.name/.lima/docker.sock" (host)
INFO[0040] [hostagent] The optional requirement 1 of 1 is satisfied
INFO[0040] [hostagent] Forwarding "/run/lima-guestagent.sock" (guest) to "/Users/user.name/.lima/docker/ga.sock" (host)
INFO[0040] [hostagent] Waiting for the final requirement 1 of 1: "boot scripts must have finished"
INFO[0040] [hostagent] Not forwarding TCP 0.0.0.0:22
INFO[0040] [hostagent] Not forwarding TCP [::]:22
INFO[0040] [hostagent] The final requirement 1 of 1 is satisfied
INFO[0040] READY. Run `limactl shell docker` to open the shell.
```

Tell Docker to use this VM rather than default Docker Desktop VM

```sh
export DOCKER_HOST="unix://$HOME/.lima/docker.sock"
```

and add it to .bash_prfile also

```sh
subl $HOME/.bash_profile
```

Check docker is happy

```sh
docker ps
.
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

## Examine what we have

```sh
ls -l $HOME/.lima
.
drwxr-xr-x   5 user.name  staff  160 23 Jun 21:02 _config
drwx------  16 user.name  staff  512 23 Jun 21:03 docker
srw-------   1 user.name  staff    0 23 Jun 21:03 docker.sock
```

```sh
ls -l $HOME/.lima/_config
.
-rw-r--r--  1 user.name  staff  1119 23 Jun 21:02 networks.yaml
-rw-------  1 user.name  staff   419 23 Jun 21:02 user
-rw-r--r--  1 user.name  staff   110 23 Jun 21:02 user.pub
```

```sh
cat $HOME/.lima/_config/networks.yaml
.
# Paths to vde executables. Because vde_vmnet is invoked via sudo it should be
# installed where only root can modify/replace it. This means also none of the
# parent directories should be writable by the user.
#
# The varRun directory also must not be writable by the user because it will
# include the vde_vmnet pid files. Those will be terminated via sudo, so replacing
# the pid files would allow killing of arbitrary privileged processes. varRun
# however MUST be writable by the daemon user.
#
# None of the paths segments may be symlinks, why it has to be /private/var
# instead of /var etc.
paths:
  vdeSwitch: /opt/vde/bin/vde_switch
  vdeVMNet: /opt/vde/bin/vde_vmnet
  varRun: /private/var/run/lima
  sudoers: /private/etc/sudoers.d/lima

group: everyone

networks:
  shared:
    mode: shared
    gateway: 192.168.105.1
    dhcpEnd: 192.168.105.254
    netmask: 255.255.255.0
  bridged:
    mode: bridged
    interface: en0
    # bridged mode doesn't have a gateway; dhcp is managed by outside network
  host:
    mode: host
    gateway: 192.168.106.1
    dhcpEnd: 192.168.106.254
    netmask: 255.255.255.0
```

```sh
ls -l $HOME/.lima/docker
.
-rw-r--r--  1 user.name  staff  157095936 23 Jun 21:02 basedisk
-rw-r--r--  1 user.name  staff    6793216 23 Jun 21:02 cidata.iso
-rw-r--r--  1 user.name  staff  738066432 23 Jun 21:03 diffdisk
srw-------  1 user.name  staff          0 23 Jun 21:03 ga.sock
-rw-r--r--  1 user.name  staff          6 23 Jun 21:02 ha.pid
srwxr-xr-x  1 user.name  staff          0 23 Jun 21:02 ha.sock
-rw-r--r--  1 user.name  staff      35386 23 Jun 21:03 ha.stderr.log
-rw-r--r--  1 user.name  staff        167 23 Jun 21:03 ha.stdout.log
-rw-r--r--  1 user.name  staff       2951 23 Jun 21:02 lima.yaml
-rw-------  1 user.name  staff          6 23 Jun 21:02 qemu.pid
srwxr-xr-x  1 user.name  staff          0 23 Jun 21:02 qmp.sock
-rw-r--r--  1 user.name  staff      24167 23 Jun 21:03 serial.log
srwxr-xr-x  1 user.name  staff          0 23 Jun 21:02 serial.sock
srw-------  1 user.name  staff          0 23 Jun 21:03 ssh.sock
```

## Setup crontab to keep clocks in sync to prevent network security issues due to clock drift

```sh
crontab -e
```

Add to end

```txt
0 * * * * docker run --rm --privileged alpine hwclock -s
```

## Restart Docker VM

```sh
limactl stop docker && limactl start docker
```

## Updating Docker

See [update my VM with my new settings](https://blog.carlosnunez.me/post/docker-desktop-alternative-for-mac/)
