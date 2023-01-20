# Python

## asdf - Python version manager - Ansible

https://asdf-vm.com/guide/getting-started.html#_3-install-asdf

```sh
brew install asdf
asdf plugin add python
.
initializing plugin repository...Cloning into '/Users/user.name/.asdf/repository'...
.
asdf list python
.
  No versions installed
.
asdf install python 3.8.15
.
Downloading python-build...
Cloning into '/Users/user.name/.asdf/plugins/python/pyenv'...
remote: Enumerating objects: 22652, done.
remote: Counting objects: 100% (227/227), done.
remote: Compressing objects: 100% (116/116), done.
remote: Total 22652 (delta 142), reused 174 (delta 106), pack-reused 22425
Receiving objects: 100% (22652/22652), 4.69 MiB | 1009.00 KiB/s, done.
Resolving deltas: 100% (15290/15290), done.
python-build 3.8.15 /Users/user.name/.asdf/installs/python/3.8.15
python-build: use openssl@1.1 from homebrew
python-build: use readline from homebrew
Downloading Python-3.8.15.tar.xz...
-> https://www.python.org/ftp/python/3.8.15/Python-3.8.15.tar.xz
Installing Python-3.8.15...
python-build: use readline from homebrew
python-build: use zlib from xcode sdk
Installed Python-3.8.15 to /Users/user.name/.asdf/installs/python/3.8.15
```

Now add to `.bash_profile`:

```sh
source "$(brew --prefix asdf)/libexec/asdf.sh"
asdf shell python 3.8.15
python --version
```
