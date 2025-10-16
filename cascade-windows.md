# cascade windows

## setup

```sh
brew tap koekeishiya/formulae
brew install yabai
brew install jq
```

For hotkey support, you need to install `skhd` as well.

```sh
brew install koekeishiya/formulae/skhd
```

Give permission to `yabai` to control MacOS: [yabai docs](<https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)>)

## list all the unique windows

```sh
yabai -m query --windows | jq '.[].app' | sort | uniq
.
"Code"
"Finder"
"Google Chrome"
"MSTeams"
"Microsoft Outlook"
"Slack"
"System Settings"
"Terminal"
```

## list displays

```sh
yabai -m query --displays | jq '.[] | {index, id, frame, label}'
```
