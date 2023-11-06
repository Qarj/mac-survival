# bash

## detect Mac and run script in new terminal

```sh
if [ "$(uname)" == "Darwin" ]; then
  osascript -e "tell app \"Terminal\" to do script \"$*\""
  exit 0
fi
```

## screen capture with delay

```sh
screencapture -C -T5 $HOME/Desktop/ScreenCap.png
```
