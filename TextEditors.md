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

## Sublime 3

https://www.sublimetext.com/

Open disk image then drag `Sublime Text.app` to Applications.
Right click running app select `Options` -> `Keep in Dock`

```
sudo mkdir /usr/local/bin
sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
```

```
subl hello.txt
```

