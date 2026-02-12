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
aws-cli/2.33.20 Python/3.13.11 Darwin/25.2.0 exe/arm64
```

## saml2aws

```sh
brew install saml2aws
sam2aws --version
.
2.36.2
```

Then create a `$HOME/.saml2aws` configuration file.
