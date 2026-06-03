# Assignment 2 — Shell, Files, Redirection, and Pipes

## Read first

Yale Chapter 3:

- 3.1 The shell
- 3.1.2 Unix filesystem
- 3.1.3 Unix command-line programs
- 3.1.6 Redirecting input and output

## Task

You are given files in `data/`. Use shell commands to create files in `work/`.

Create this directory:

```bash
mkdir -p work
```

Then produce these files:

1. `work/names_sorted.txt`
   - Sort `data/names.txt` alphabetically.
2. `work/error_lines.txt`
   - Extract only lines containing `ERROR` from `data/app.log`.
3. `work/warnings_and_errors.txt`
   - Extract lines containing either `WARNING` or `ERROR` from `data/app.log`.
4. `work/unique_words.txt`
   - Convert `data/words.txt` into sorted unique words, one per line.
5. `work/line_counts.txt`
   - Create a file containing line counts for `data/names.txt`, `data/app.log`, and `data/words.txt` using `wc -l`.

## Rules

- Use shell commands, redirection, and pipes.
- Do not manually type the expected output into the files.
- Commands you should practice: `cat`, `grep`, `sort`, `uniq`, `wc`, `tr`, redirection `>`, and pipes `|`.

## Check your work

```bash
bash check.sh
```
