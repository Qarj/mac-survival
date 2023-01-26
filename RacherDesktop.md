# RancherDesktop

Open source docker desktop alternative for Mac and Windows.

## Installation

Instructions here: https://docs.rancherdesktop.io/getting-started/installation/

Then start the Rancher Desktop app.

Choose to use `dockerd` instead of `containerd`.

The following export will be added to `.bash_profile`:

```sh
export PATH="/Users/user.name/.rd/bin:$PATH"
```

Create a file

```sh
nano "$HOME/Library/Application Support/rancher-desktop/lima/_config/default.yaml"
```

with the following content

```yaml
hostResolver:
    enabled: false
    ipv6: null
    dns:
        - 8.8.8.8
```

Restart Rancher Desktop.

If you don't do this last step, you'll get

```txt
Error response from daemon: Get "https://registry-1.docker.io/v2/": dial tcp: lookup registry-1.docker.io i/o timeout
```

errors.

## Troubleshooting

### nginx DNS resolution

Under the `resolve` directive, add `ipv6=off;` to disable IPv6.

### possible networking fix

When running the container, add the following flag:

```sh
--add-host=host.docker.internal:IP_OF_HOST
```

where `IP_OF_HOST` is the IP address of the host machine.

### another possible networking fix

Copy host resolver to rancher vm

```sh
rdctl shell sudo bash -c "echo \"$(cat /etc/resolv.conf)\" >/etc/resolv.conf"
```
