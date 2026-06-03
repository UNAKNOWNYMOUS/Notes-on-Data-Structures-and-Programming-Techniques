# Assignment 1 — Environment Check

## Read first

Yale notes:

- Chapter 1 overview/introduction
- Chapter 2 sections on developing locally and compiling/running programs
- Chapter 3 intro to Linux programming environment

## Task

Run the environment checker:

```bash
bash check_env.sh
```

Then create a file named:

```text
environment.md
```

Inside it, answer these questions:

1. What OS/environment are you using? Example: Arch Linux, Ubuntu, WSL, macOS, etc.
2. What editor are you using?
3. What versions of `gcc`, `make`, `gdb`, `valgrind`, and `git` do you have?
4. In 3–5 sentences, why are C/Linux tooling useful for your C++/systems path?

## Correctness criteria

- `check_env.sh` should pass for the tools you need.
- `environment.md` must exist and should not be empty.
- Valgrind is strongly recommended on Linux. If you are on macOS and Valgrind is unavailable, write that in `environment.md`.
