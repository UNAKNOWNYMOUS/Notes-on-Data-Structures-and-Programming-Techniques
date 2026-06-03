# Yale CPSC 223 Notes Practice Pack — Through Chapter 3

This practice pack is for working through Yale CPSC 223 notes through the end of Chapter/Section 3:

- 1. Course administration / course overview
- 2. The Zoo: accounts, remote access, developing locally, compiling and running a first program
- 3. The Linux programming environment: shell, filesystem, redirection, editors, `gcc`, `make`, assertions, `gdb`, Valgrind, performance tools, and Git

Main goal: become comfortable working like a C programmer on Linux before you go deeper into C syntax and data structures.

## How to use this archive

Work in order:

1. `00_reading_checklist.md`
2. `01_environment_check/`
3. `02_shell_redirection/`
4. `03_gcc_make/`
5. `04_debugging_gdb_valgrind/`
6. `05_git_lab/`

At the end, run:

```bash
./run_all_checks.sh
```

The checks do not prove perfect mastery, but they catch whether your programs build, run, and match the expected behavior.

## Recommended compiler flags

```bash
gcc -std=c11 -Wall -Wextra -pedantic -g -fsanitize=address,undefined file.c -o program
```

Use Valgrind without sanitizers when you want memory-leak checks:

```bash
gcc -std=c11 -Wall -Wextra -pedantic -g file.c -o program
valgrind --leak-check=full --track-origins=yes ./program
```
