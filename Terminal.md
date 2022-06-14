# Terminal

## Open a new terminal window and run a command

```sh
osascript -e 'tell app "Terminal" to do script "cd ~/git"'
```

With arguments passed to script

```sh
if [ "$(uname)" == "Darwin" ]; then
  osascript -e "tell app \"Terminal\" to do script \"$*\""
fi
```

## Open a new terminal at the current folder

Big Sur and newer

```sh
open -a /System/Applications/Utilities/Terminal.app .
```

## Close terminal window using keyboard

`CTRL-W` if using remapped keys, otherwise `CMD-W`

## Jump between terminal windows

`CTRL-left arrow` or `CTRL-right arrow` if using remapped keys, otherwise `CMD-left arrow` or `CMD-right arrow`
