# dotnet on Mac M1

https://learn.microsoft.com/en-us/dotnet/core/install/macos

After running the install, make sure the permissions are OK.

```sh
sudo chmod 755 /usr/local/share
```

Also add it to path in both .zprofile and .zshrc

```sh
export PATH="/usr/local/share/dotnet:$PATH"
```

## .NET 7.0

Donwload Arm64 installer https://dotnet.microsoft.com/en-us/download/dotnet/7.0

Downloaded a file called `dotnet-sdk-7.0.100-osx-arm64.pkg`.

Double click on it and install.

The following was installed:

```txt
.NET SDK 7.0.100
.NET Runtime 7.0.0
ASP.NET Core Runtime 7.0.0
```

```sh
dotnet test
.
Welcome to .NET 7.0!
---------------------
SDK Version: 7.0.100

Telemetry
---------
The .NET tools collect usage data in order to help us improve your experience. It is collected by Microsoft and shared with the community. You can opt-out of telemetry by setting the DOTNET_CLI_TELEMETRY_OPTOUT environment variable to '1' or 'true' using your favorite shell.

Read more about .NET CLI Tools telemetry: https://aka.ms/dotnet-cli-telemetry

----------------
Installed an ASP.NET Core HTTPS development certificate.
To trust the certificate run 'dotnet dev-certs https --trust' (Windows and macOS only).
Learn about HTTPS: https://aka.ms/dotnet-https
----------------
Write your first app: https://aka.ms/dotnet-hello-world
Find out what's new: https://aka.ms/dotnet-whats-new
Explore documentation: https://aka.ms/dotnet-docs
Report issues and find source on GitHub: https://github.com/dotnet/core
Use 'dotnet --help' to see available commands or visit: https://aka.ms/dotnet-cli
--------------------------------------------------------------------------------------
```

## .NET 6.0

Download Arm64 installer https://dotnet.microsoft.com/en-us/download/dotnet/6.0

Downloaded a file called `dotnet-sdk-6.0.403-osx-arm64.pkg`.

Double click on it and install.

The following was installed:

```txt
.NET SDK 6.0.403
.NET Runtime 6.0.11
ASP.NET Core Runtime 6.0.11
```

## Resolving SSL issues

Run these commands one at a time

```sh
dotnet dev-certs https --clean
dotnet dev-certs https --trust
```
