# Free-Env

## usage

``` bash
nim c --gcc.option="-static" --gcc.option="-no-pie" --passL:"-static" -d:release -d:ssl main.nim
```