# Assignment 4 — Debugging with Assertions, GDB, and Valgrind

## Read first

Yale Chapter 3:

- 3.4 Debugging tools
- 3.4.1 Debugging in general
- 3.4.2 Assertions
- 3.4.3 The GNU debugger `gdb`
- 3.4.4 Valgrind

## Task

`average_buggy.c` is intentionally broken.

Fix it so that:

```bash
./average 1 2 3
```

prints:

```text
average: 2.00
```

And:

```bash
./average 10 20 30 40
```

prints:

```text
average: 25.00
```

If no numbers are provided, it should print a usage message to `stderr` and return nonzero.

## Required debugging evidence

Create `debug_notes.md` and include:

1. The bug or bugs you found.
2. One `gdb` command you used.
3. What Valgrind said before/after your fix, or explain if Valgrind is unavailable.
4. What compiler warning helped you, if any.

## Check your work

```bash
bash check.sh
```

The check script compiles your fixed file as `average`.
