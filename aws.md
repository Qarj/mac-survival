# AWS

## AWS CLI

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

```sh
cd $HOME/Downloads
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
```

After installation is complete, debug logs are written to `/var/log/install.log`.

```sh
aws --version
aws-cli/2.9.15 Python/3.9.11 Darwin/21.6.0 exe/x86_64 prompt/off
```
