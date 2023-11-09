# Core Dumps

Need to enable other users (including yourself) to write to the core dump directory.

```sh
sudo chmod o+w /cores/;
ulimit -c unlimited
```

The ulimit only works for the current shell.
