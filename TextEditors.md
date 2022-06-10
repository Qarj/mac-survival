# Setup and Start Text Editors

## Code

Install from https://code.visualstudio.com/docs/setup/mac

`CTRL-SHIFT-P` (after mandatory keyboard mods) then type `shell command`

or

`SUPER-SHIFT-P` depending on keyboard mods

May need to

```sh
sudo unlink /usr/local/bin/code
```

if Visual Studio Code was launched from the Downloads folder and later moved to the Applications folder.

## Sublime 4

https://www.sublimetext.com/

Open disk image then drag `Sublime Text.app` to Applications.
Right click running app select `Options` -> `Keep in Dock`

```sh
sudo mkdir /usr/local/bin
sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
```

```txt
subl hello.txt
```

Quit sublime from menu to remove from dock.

## Atom

Install from https://atom.io/ - was version `1.60.0`

Start Atom then Click on `Atom` menu and select `Install Shell Commands`, `atom .` will then be possible.

Closing the Atom window will not remove it from the dock.

## Brackets

Install from https://brackets.io/ - was version `2.0.1`

Under `File` menu there is `Install Command Line Shortcut`, `brackets .` will then be possible.

Closing the brackets window will remove it from the dock.

## Ultraedit

```sh
sudo mkdir /usr/local/bin
sudo ln -s /Applications/UltraEdit.app/Contents/MacOS/UltraEdit /usr/local/bin/uem
```
