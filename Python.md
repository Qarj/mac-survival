# Python

Set up Python 3.12.12 as the default Python via pyenv on Mac:

We don't need this to begin with, might want it later.

1. Ensure brew is installed (it should be already).

2. Ensure brew is on your PATH for your shell (should already be done).

- For zsh (default on modern macOS):

```sh
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

3. Install pyenv and build dependencies

```sh
brew update
brew install pyenv
brew install openssl readline sqlite3 xz zlib tcl-tk
```

4. Add pyenv init to your shell startup (zsh)

```sh
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zprofile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zprofile
echo 'eval "$(pyenv init -)"' >> ~/.zprofile
```

5. Restart your terminal, or source your profile

```sh
exec zsh -l
```

6. Install Python 3.12.12 via pyenv

```sh
pyenv install 3.12.12
```

7. Make 3.12.12 the global (default) Python

```sh
pyenv global 3.12.12
```

8. Verify

```sh
python --version
which python
pyenv versions
```

You should see Python 3.12.12 and the shim path under ~/.pyenv/shims.
