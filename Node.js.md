# Install Node.js on macOS

Use NVM via Homebrew

```sh
brew update
brew install nvm
```

Create NVM home directory

```sh
mkdir ~/.nvm
```

Open bash profile

```sh
nano ~/.bash_profile
```

Add to end of bash profile

```sh
# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # nvm bash_completion
```

Then follow the nvm instructions in `linux-survival/Node.js.md`.
