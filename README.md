# Nop Clang Plugin

This is a clang plugin which does nothing.

## Build

Requirements: llvm-16, mold (optional), fd (optional)

```txt
# If necessary, remove an option for mold from this file.
$ . ./cmake-command.sh
```

## Test

```txt
$ cd test
$ . ./clang-command.sh
```

This will output :

```txt
I am NopPlugin!
```
