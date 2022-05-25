# Wine

https://github.com/Gcenx/wine-on-mac

```sh
brew tap homebrew/cask-versions
brew install --cask --no-quarantine wine-staging
.
==> Caveats
wine-staging supports both 32-bit and 64-bit. It is compatible with an existing
32-bit wine prefix, but it will now default to 64-bit when you create a new
wine prefix. The architecture can be selected using the WINEARCH environment
variable which can be set to either win32 or win64.

To create a new pure 32-bit prefix, you can run:
  $ WINEARCH=win32 WINEPREFIX=~/.wine32 winecfg

See the Wine FAQ for details: https://wiki.winehq.org/FAQ#Wineprefixes
```

```sh
mkdir $HOME/wine
mkdir $HOME/wine/wine32
mkdir $HOME/wine/wine64
```

```sh
file `which wine`
.
/opt/homebrew/bin/wine: Mach-O executable i386
.
file `which wine64`
/opt/homebrew/bin/wine64: Mach-O 64-bit executable x86_64
```

Run winecfg at least once

```sh
WINEARCH=win64 WINEPREFIX=~/wine/wine64 wine64 winecfg
```

## Notepad++

Get laterst installer URL from https://notepad-plus-plus.org/downloads/

```sh
mkdir ~/Downloads/progs
cd ~/Downloads/progs
wget https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.4.1/npp.8.4.1.Installer.arm64.exe -O npp.exe
wget https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.4.1/npp.8.4.1.Installer.x64.exe -O npp.exe
```

Run the installer

```sh
WINEARCH=win64 WINEPREFIX=~/wine/wine64 wine64 npp.exe
```
