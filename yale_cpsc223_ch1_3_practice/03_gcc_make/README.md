# Assignment 3 — `gcc`, Warnings, and `make`

## Read first

Yale Chapter 3:

- 3.3.1 The GNU C compiler `gcc`
- 3.3.2 Make
- 3.4.1 Debugging in general
- 3.4.2 Assertions

## Task A — `hello.c`

Complete `hello.c` so that running:

```bash
./hello
```

prints exactly:

```text
Hello, C systems path!
```

## Task B — `repeat.c`

Complete `repeat.c` so that running:

```bash
./repeat systems 3
```

prints:

```text
systems
systems
systems
```

Rules:

- If the user passes the wrong number of arguments, print a usage message to `stderr` and return nonzero.
- If the count is less than 1, print an error to `stderr` and return nonzero.

## Task C — `Makefile`

Fill in the `Makefile` so that these work:

```bash
make
make clean
```

## Check your work

```bash
bash check.sh
```
