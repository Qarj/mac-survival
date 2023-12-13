# Core Dumps

Need to enable other users (including yourself) to write to the core dump directory.

```sh
sudo chmod o+w /cores/;
ulimit -c unlimited
```

The ulimit only works for the current shell.

View the core dump

```sh
lldb -c /cores/core.22870
```

Then run a backtrace

```sh
bt
```
