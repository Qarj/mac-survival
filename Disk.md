# Disk

## iostat

```sh
iostat -w1
.
              disk0       cpu    load average
    KB/t  tps  MB/s  us sy id   1m   5m   15m
    6.86    7  0.05  10  6 83  2.11 2.50 2.58
    0.00    0  0.00   8  6 86  2.11 2.50 2.58
    0.00    0  0.00   8  6 86  2.11 2.50 2.58
```

## zip folders ingoring some

Double quotes are needed.

```sh
zip -r my-project.zip . -x "node_modules/*" "test-reports*"
```
