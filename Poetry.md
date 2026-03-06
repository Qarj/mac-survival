# Poetry setup

To be installed after Python has been setup.

### Poetry - must be installed globally with a clean shell

Close all terminals and open a new one.

Make sure your prompt DOES NOT have a virtualenv/pyenv name (usually shown in `(...)` at the start).

```sh
echo $VIRTUAL_ENV  # Should be empty
echo $PYENV_VERSION  # Should be empty (or unset)
```

If they are _not_ empty, run:

```sh
deactivate 2>/dev/null
pyenv deactivate 2>/dev/null
unset VIRTUAL_ENV PYENV_VERSION
```

```sh
curl -sSL https://install.python-poetry.org | python3 -
```

Follow the instructions to add poetry to your path.

Restart your terminal.

Then check if poetry is installed correctly with

```sh
poetry --version
```

Finally, ensure Poetry makes venvs in each project folder.

```sh
poetry config virtualenvs.in-project true
```
