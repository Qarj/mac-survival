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
| Command spacebar      | Windows      |

## Karabiner-Elements keyboard modifier

Alternatively install `Karabiner-Elements` from https://karabiner-elements.pqrs.org/

After enabling all the security, it will take over the remapping and the remapping of control keys in the system
preferences will be ignored.

At time of writing it was version v14.4.0 being used with macOS Monterey Version 12.4.

For the DAS Keyboard Model S, these remappings had to be made (using British - PC)

```
left_command left_control
left_control left_command
non_us_backslash grave_accent_and_tilde
grave_accent_and_tilde non_us_backslash
```

## Mouse

System Preferences -> Mouse -> uncheck `Scroll direction: Natural`

## Finder

See hidden folders

```
sudo defaults write com.apple.finder AppleShowAllFiles YES; killall Finder
```

## Run apps from anywhere

```
sudo spctl --master-disable
```

## Bash

Change from new default of zsh to bash

```sh
chsh -s /bin/bash
```

If you don't change the shell, git might give strange error messages.

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


## Brew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Meld

```
brew install --cask meld
```
