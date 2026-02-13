# Mandatory

## Keyboard detection

If Keyboard Setup Assistant is hidden

```sh
sudo rm /Library/Preferences/com.apple.keyboardtype.plist
```

Reboot. Preferences -> Keyboard

## Keyboard

System Preferences -> Language & Region -> Keyboard Preferences
Add `British - PC` keyboard. Remove `British` keyboard.

System Preferences -> Keyboard -> Modifier Keys
Using the default keyboard `Karabiner VirtualHIDKeyboard`:
(Changing for `Das Keyboard Model S` did not seem to make a difference.)

1. Set the Control key to be Command
2. Set the Command key to be Control (CTRL-C CTRL-V now possible)
3. Set the Fn Key to be sControl

Note these are the default translations if you don't change the modifier keys:

| macOS                 | Windows      |
| --------------------- | ------------ |
| Option                | Alt          |
| Command               | Windows      |
| Command Option Escape | CTRL ALT DEL |
| Command Shift 3       | Print Screen |
| Command space bar     | Windows      |

## Karabiner-Elements keyboard modifier

Note: Blocked by install, use alternative option Ukelele

/Applications/.Karabiner-VirtualHIDDevice-Manager.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Manager activate

Alternatively install `Karabiner-Elements` from https://karabiner-elements.pqrs.org/

After enabling all the security, it will take over the remapping and the remapping of control keys in the system
preferences will be ignored.

At time of writing it was version v14.4.0 being used with macOS Monterey Version 12.4.

For the DAS Keyboard Model S, these re-mappings had to be made (using British - PC)

```txt
left_command left_control
left_control left_command
non_us_backslash grave_accent_and_tilde
grave_accent_and_tilde non_us_backslash
```

Ensure the Virtual keyboard type is set to `ANSI`.

## Ukelele Keyboard Layout Editor for macOS

1. Install Ukelele from https://software.sil.org/ukelele/

2. Make sure the currently active keyboard is the best available - e.g. `British - PC`

3. From the File menu, select `New From Current Input Source`.

An Untitled window opens with a heading `Keyboard Layouts in this collection`.

There will be a line like `British - PC copy 3` double click on it.

Find a key you want to remap - for example, if the backslash key is in the wrong place,
double click on `\` then type a `\`.

Hold down the shift key for the shift key version. Then double click on the key while holding shift.

Note - you generally remap a key to itself, so you map `\` to `\` and "|" to "|"
and the same for the paired wrong key, and even though it doesn't seem to make
much sense it does actually have the affect of swapping the keys.

4. Save the layout, e.g. to Documents as `British - PC copy 3`.

5. Check the bundle is present, then copy recursively to the correct location

```
ls "$HOME/Documents/British - PC copy 3.bundle"
cp -R "$HOME/Documents/British - PC copy 3.bundle" "$HOME/Library/Keyboard Layouts/"
ls "$HOME/Library/Keyboard Layouts/"
```

6. Log out and back in, then select it in Settings / Keyboard

## Mouse

System Preferences -> Mouse -> uncheck `Scroll direction: Natural`

## Finder

See hidden folders

```sh
sudo defaults write com.apple.finder AppleShowAllFiles YES; killall Finder
```

## Run apps from anywhere

```sh
sudo spctl --master-disable
```

## Bash

Change from new default of zsh to bash

```sh
chsh -s /bin/bash
```

If you don't change the shell, git might give strange error messages.

Silence nag regarding change to zsh in `.bash_profile`

```sh
export BASH_SILENCE_DEPRECATION_WARNING=1
```

Change prompt to format of `user.name@COMPUTERNAME:~/git/mac-survival`

```sh
nano ~/.bash_profile
```

Add to end of `.bash_profile`

```sh
export PS1='\u@\H:\w$ '
```

To activate immediately

```sh
source ~/.bash_profile
```

Or for a simpler prompt

```sh
export PS1='\w$ '
```

## Disable com.apple.quarantine extended attribute for downloaded files by Brew and others

```sh
sudo defaults write com.apple.LaunchServices LSQuarantine -bool NO
```

Reboot.

https://apple.stackexchange.com/questions/373176/disable-the-use-of-the-com-apple-quarantine-extended-attribute-on-mojave

## Brew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Meld

```sh
brew install --cask meld
```

Be sure to run the "Run apps from anywhere" above else meld won't run.

## Add colour to ls output

https://www.cyberciti.biz/faq/apple-mac-osx-terminal-color-ls-output-option/

```sh
nano ~/.bash_profile
```

Copy paste to end

```sh
# coloured ls output
export CLICOLOR=1
alias ls='ls -G'
alias ll='ls -lG'
```

## htop

```sh
brew install htop
```

# python3 python

Add an alias for `python` in the `.bash_profile`

```sh
alias python=/usr/bin/python3
```

Restart shell and check version

```sh
python --version
.
Python 3.8.9
```

Alias doesn't really work, it isn't a proper install. `which python` returns nothing.

https://www.mediaglasses.blog/2021/10/30/managing-python-on-macos-monterey/

```sh
brew install pyenv
```

```sh
pyenv install 3.10.0
pyenv global 3.10.0
pyenv version
.
3.10.0 (set by /Users/user.name/.pyenv/version)
```

```sh
echo -e $'if command -v pyenv 1>/dev/null 2>&1; then\\n  export PYENV_ROOT="$HOME/.pyenv"\\n  export PATH="$PYENV_ROOT/bin:$PATH"\\n  eval "$(pyenv init --path)"\\n  eval "$(pyenv init -)"\\nfi' >> ~/.bash_profile
```

This add the following to the `.bash_profile`

```sh
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi
```

After opening a new terminal window

```sh
which python
.
/Users/user.name/.pyenv/shims/python
.
python --version
.
Python 3.10.0
```

## Python 3.9.13 for Rasa X

```sh
pyenv install 3.9.13
pyenv global 3.9.13
```

Upgrade setup tools

```sh
python -m pip install --upgrade setuptools
```

Add environment variable to `.bash_profile`

```sh
export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=true
export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=true
```

This tells the build system to use the system OpenSSL and zlib libraries instead of the bundled ones.

## Create a virtual environment for Rasa X

```sh
cd $HOME
python -m venv ./rasa
source ./rasa/bin/activate
```

Update pip

```sh
pip --version
.
pip 22.0.4 from /Users/user.name/rasa/lib/python3.9/site-packages/pip (python 3.9)
.
pip install -U pip
.
pip 22.3.1 from /Users/user.name/rasa/lib/python3.9/site-packages/pip (python 3.9)
```

## Preferences

Dock & Menu Bar

```txt
uncheck Show recent applications in Dock
```

## RDP

First install an x11 display manager like `XQuartz`

https://www.xquartz.org/ `XQuartz-2.8.1.dmg`

Log out and back in.

`DISPLAY` environment variable should be available.

```sh
/private/tmp/com.apple.launchd.ZK8rMh44Vh/org.xquartz:0
```

```sh
brew install freerdp
```

`xfreerdp` will now work.

## wget

```sh
brew install wget
.
wget --version
GNU Wget 1.21.3 built on darwin21.3.0.

-cares +digest -gpgme +https +ipv6 +iri +large-file -metalink +nls
+ntlm +opie -psl +ssl/openssl

Wgetrc:
    /opt/homebrew/etc/wgetrc (system)
Locale:
    /opt/homebrew/Cellar/wget/1.21.3/share/locale
Compile:
    clang -DHAVE_CONFIG_H -DSYSTEM_WGETRC="/opt/homebrew/etc/wgetrc"
    -DLOCALEDIR="/opt/homebrew/Cellar/wget/1.21.3/share/locale" -I.
    -I../lib -I../lib -I/opt/homebrew/opt/openssl@1.1/include
    -I/opt/homebrew/Cellar/libidn2/2.3.2/include -DNDEBUG -g -O2
Link:
    clang -I/opt/homebrew/Cellar/libidn2/2.3.2/include -DNDEBUG -g -O2
    -L/opt/homebrew/Cellar/libidn2/2.3.2/lib -lidn2
    -L/opt/homebrew/opt/openssl@1.1/lib -lssl -lcrypto -ldl -lz
    ../lib/libgnu.a -liconv -lintl -Wl,-framework -Wl,CoreFoundation
    -lunistring

Copyright (C) 2015 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later
<http://www.gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Originally written by Hrvoje Niksic <hniksic@xemacs.org>.
Please send bug reports and questions to <bug-wget@gnu.org>.
```

## cmake

```sh
brew install cmake
```

## Turn off Spotlight indexing for code folders

System Preferences -> Spotlight -> Privacy -> +

Will save enormous cpu.

## neofetch

```sh
brew install neofetch
```

## telnet

```sh
brew install telnet
```

## ripgrep

```sh
brew install ripgrep
```
