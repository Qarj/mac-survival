# Shortcuts, assuming CTRL and CMD keys are swapped

| Shortcut               | Description                          |
| ---------------------- | ------------------------------------ |
| CTRL + SHIFT + CMD + 4 | Clip screen directly to clipboard    |
| CTRL + SHIFT + 4       | Clip screen to to file on Desktop    |
| CTRL + SHIFT + 3       | Save whole screen to file on Desktop |
| CTRL + R               | Refresh browse page                  |
| CTRL + SHIFT + B       | Toggle bookmarks bar                 |
| CTRL + SHIFT + G       | Open root in Finder                  |

## vscode keybindings.json

https://code.visualstudio.com/docs/getstarted/keybindings

To open `keybindings.json` File/Code->Preferences->Keyboard Shortcuts then Click icon on top right corner that says "Open Keyboard Shortcuts(JSON)" when you hover the little icon with the paper and arrow.

```json
// Place your key bindings in this file to override the defaults
[
    {
        "key": "ctrl+m",
        "command": "editor.action.triggerParameterHints",
        "when": "editorHasSignatureHelpProvider && editorTextFocus"
    },
    {
        "key": "cmd+m",
        "command": "editor.action.triggerParameterHints",
        "when": "editorHasSignatureHelpProvider && editorTextFocus"
    },
    {
        "key": "ctrl+,",
        "command": "editor.action.triggerSuggest",
        "when": "editorHasCompletionItemProvider && textInputFocus && !editorReadonly"
    },
    {
        "key": "cmd+,",
        "command": "editor.action.triggerSuggest",
        "when": "editorHasCompletionItemProvider && textInputFocus && !editorReadonly"
    },
    {
        "key": "ctrl+.",
        "command": "editor.action.quickFix",
        "when": "editorHasCodeActionsProvider && editorTextFocus && !editorReadonly"
    },
    {
        "key": "cmd+.",
        "command": "editor.action.quickFix",
        "when": "editorHasCodeActionsProvider && editorTextFocus && !editorReadonly"
    },
    {
        "key": "cmd+numpad4",
        "command": "workbench.action.navigateBack"
    },
    {
        "key": "ctrl+numpad4",
        "command": "workbench.action.navigateBack"
    },
    {
        "key": "cmd+numpad6",
        "command": "workbench.action.navigateForward"
    },
    {
        "key": "ctrl+numpad6",
        "command": "workbench.action.navigateForward"
    },
    {
        "key": "cmd+r",
        "command": "editor.action.startFindReplaceAction",
        "when": "editorFocus || editorIsOpen"
    }
]
```
