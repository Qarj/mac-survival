# Docker Desktop

Mac with Apple silicon

https://docs.docker.com/desktop/install/mac-install/

Install Rosetta 2

```sh
softwareupdate --install-rosetta
.
I have read and agree to the terms of the software license agreement. A list of Apple SLAs may be found here: http://www.apple.com/legal/sla/
Type A and press return to agree: A
2022-12-05 14:21:36.428 softwareupdate[94470:13913962] Package Authoring Error: 012-40509: Package reference com.apple.pkg.RosettaUpdateAuto is missing installKBytes attribute
Install of Rosetta 2 finished successfully
```

Click on `Mac with Apple silicon`. It will download the `Docker.dmg` file to `~/Downloads`.

```sh
cd ~/Downloads
sudo hdiutil attach Docker.dmg
.
Password:
Checksumming Protective Master Boot Record (MBR : 0)…
Protective Master Boot Record (MBR :: verified CRC32 $9BFFF5B0
Checksumming GPT Header (Primary GPT Header : 1)…
 GPT Header (Primary GPT Header : 1): verified CRC32 $7097366B
Checksumming GPT Partition Data (Primary GPT Table : 2)…
GPT Partition Data (Primary GPT Tabl: verified CRC32 $8ECD6ABC
Checksumming  (Apple_Free : 3)…
                    (Apple_Free : 3): verified CRC32 $00000000
Checksumming EFI System Partition (C12A7328-F81F-11D2-BA4B-00A0C93EC93B : 4)…
..........
EFI System Partition (C12A7328-F81F-: verified CRC32 $B54B659C
Checksumming disk image (Apple_HFS : 5)…
................................................................................................................
          disk image (Apple_HFS : 5): verified CRC32 $19A27743
Checksumming  (Apple_Free : 6)…
.......................................................................................................................
                    (Apple_Free : 6): verified CRC32 $00000000
Checksumming GPT Partition Data (Backup GPT Table : 7)…
GPT Partition Data (Backup GPT Table: verified CRC32 $8ECD6ABC
Checksumming GPT Header (Backup GPT Header : 8)…
  GPT Header (Backup GPT Header : 8): verified CRC32 $F3C42A83
verified CRC32 $D7EB48A5
/dev/disk4          	GUID_partition_scheme
/dev/disk4s1        	EFI
/dev/disk4s2        	Apple_HFS                      	/Volumes/Docker
.
sudo /Volumes/Docker/Docker.app/Contents/MacOS/install
.
{"time":"2022-12-05T14:26:05.861806Z","level":"INFO","prefix":"-","file":"processes.go","line":"80","message":"EnsureDockerFinished: looking for com.docker.hyperkit qemu-system-aarch64 com.docker.virtualization com.docker.driver.amd64-linux Docker com.docker.backend Docker Desktop com.docker.vpnkit vpnkit-bridge com.docker.dev-envs com.docker.extensions"}
{"time":"2022-12-05T14:26:06.813742Z","level":"INFO","prefix":"-","file":"processes.go","line":"91","message":"no docker processes running"}.
.
sudo hdiutil detach /Volumes/Docker
.
"disk4" ejected.
```

`Docker` is now available in Launchpad.

On starting the first time, there is a message:

```txt
Docker Desktop wants to
create symlinks for docker binaries in /usr/local/bin;
create /var/run/docker.sock symlink;
add startup task to symlink /Users/user.name/.docker/run/docker.sock to /var/run/docker.sock.

If rejected, Docker Desktop will create symlinks in ~/.docker/bin and edit your shell profile to ensure it's on your PATH. Please reload any open shells for the changes to take place.
```

Confirmed.

After this, Docker Desktop looks like it is running, but there are errors saysing the Docker Daemon is not running.

Tried restarting Docker Desktop, but it did not reappear.

Rebooted. Started again and was give the messge

```txt
Docker Desktop wants to create symlinks for docker binaries in /usr/local/bin.

If rejected, Docker Desktop will create symlinks in ~/.docker/bin and edit your shell profile to ensure it's on your PATH. Please reload any open shells for the changes to take place.
```

Confirmed.

Still getting errors.

```sh
docker run -d -p 80:80 docker/getting-started
.
docker: Cannot connect to the Docker daemon at unix:///Users/user.name/.lima/docker.sock. Is the docker daemon running?.
See 'docker run --help'.
```

Had to remove environment variable `DOCKER_HOST` to get it to work.

## Uninstall Docker Desktop

1. Start Docker
2. Click on the Docker icon in the menu bar
3. Click on `Preferences`
4. Find the uninstall option, might need to click on the other icon that looks like preferences
5. Go into Finder / Applications, drag the Docker app to the trash
