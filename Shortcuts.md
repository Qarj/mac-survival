# Shortcuts, assuming CTRL and CMD keys are swapped

| Shortcut               | Description                       |
| ---------------------- | --------------------------------- |
| CTRL + SHIFT + CMD + 4 | Clip screen directly to clipboard |
| CTRL + R               | Refresh browse page               |
| CTRL + SHIFT + B       | Toggle bookmarks bar              |
| CTRL + SHIFT + G       | Open root in Finder               |

## vscode keybindings.json

```json
// Place your key bindings in this file to override the defaults
[
  {
    "key": "ctrl+.",
    "command": "editor.action.triggerSuggest",
    "when": "editorHasCompletionItemProvider && textInputFocus && !editorReadonly"
  },
  {
    "key": "cmd+.",
    "command": "editor.action.triggerSuggest",
    "when": "editorHasCompletionItemProvider && textInputFocus && !editorReadonly"
  }
]
```
