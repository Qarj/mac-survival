# bash

## detect Mac and run script in new terminal

```sh
if [ "$(uname)" == "Darwin" ]; then
  osascript -e "tell app \"Terminal\" to do script \"$*\""
  exit 0
fi
```
