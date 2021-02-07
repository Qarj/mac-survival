# Mandatory

## Keyboard

System Preferences -> Keyboard -> Modifier Keys
Using the default keyboard `Karabiner VirtualHIDKeyboard`:
(Changing for `Das Keyboard Model S` did not seem to make a difference.)

1. Set the Control Key to be Command
2. Set the Command sKey to be Control
3. Set the Fn Key to be sControl

Note these are the default translations if you don't change the modifier keys:

| macOS                 | Windows      |
| --------------------- | ------------ |
| Option                | Alt          |
| Command               | Windows      |
| Command Option Escape | CTRL ALT DEL |
| Command Shift 3       | Print Screen |
| Command spacebar      | Windows      |

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

## Git

```
brew install --cask meld
```
