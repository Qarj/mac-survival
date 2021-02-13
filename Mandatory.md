# Mandatory

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

```
nano ~/.bash_profile
```

Add to end of `.bash_profile`

```
export PS1='\u@\H:\w$ '
```

To activate immediately

```
source ~/.bash_profile
```

## Brew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Meld

```
brew install --cask meld
```
