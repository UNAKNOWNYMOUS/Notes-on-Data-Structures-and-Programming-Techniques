---
id: chapter_3
aliases: []
tags: []
---

# 3 The Linux programming environment
## 3.1 The shell
### 3.1.1 Getting a shell prompt in the Zoo
### 3.1.2 The Unix filesystem
- Most of what one does with Unix programs is manipulate the filesystem.
- Unix files are unstructured blobs of data whose names are given by paths consisting of a sequence of directory names separated by slashes.
### 3.1.3 Unix command-line programs
### 3.1.4 Stopping and interrupting programs
- `ctrl-C` = interrupt the process. Many processes (including any program you write unless you trap SIGINT using the `sigaction` system call) will die instantly when you do this. Some won't.
- `ctrl-Z` = Suspend the process. This will leave a stopped process lying around. Type `jobs` to list all your stopped processes, `fg` to restart the last process (or `fg %1` to start process `%1` etc.), `bg` to keep running the stopped process in the background, `kill %1` to attempt to end process `%1` politely, `kill -KILL %1` to end process `%1` even if it is intercepting normal kills.
- `ctrl-D` = Send end-of-file to the process. Useful if you are typing test input to a process that expects to get EOF eventually. For test input, you are often better putting it into a file and using input redirection (`./program < test-input-file`); this way you can redo the test after you fix the bugs it reveals.
- `ctrl-\` = Quit the process. Sends a SIGQUIT, which asks a process to quit and dump core. Mostly useful if `ctrl-C` and `ctrl-Z` don't work.
- If you have a runaway process that you can't get rid of otherwise, you can use `ps g` to get a list of all your processes and their process ids. The `kill` command can then be used on the offending process, e.g. `kill -KILL 6666` if your evil process has process id 6666. Sometimes the `killall` command can simplify this procedure e.g. `killall -KILL evil` halts all process with command name `evil`.
### 3.1.5 Running your own programs
### 3.1.6 Redirecting input and output
- `/dev/null` = As input, it looks like an empty file. As output, it eats an characters sent to it.
- You can also pipe programs together, connecting the output of one to the input of the next.
- Pipes can often substitute for hours of real programming.
## 3.2 Text editors
### 3.2.1 Writing C programs with Emacs
#### 3.2.1.1 My favorite Emacs commands
### 3.2.2 Using Vi instead of Emacs
#### 3.2.2.1 My favorite Vim commands
##### 3.2.2.1.1 Normal mode
##### 3.2.2.1.2 Insert mode
#### 3.2.2.2 Settings
## 3.3 Compilation tools
### 3.3.1 The GNU C Compiler gcc
- A C program will typically consist of one or more files whose names end with `.c`.
- `gdb` needs: `gcc -g3 -o foo foo.c`
- By default, `gcc` doesn't check everything that might be wrong with your program. But if you give it a few extra arguments, it will warn you about many (but not all) potential problems: `gcc -g3 -Wall -o foo foo.c`.
### 3.3.2 Make
- For complicated programs involving multiple source files, you are probably better off using `make` than calling `gcc` directly.
  - Make is a "rule-based expert system" that figures out how to compile programs given a little bit of information about their components.
- In general you will probably want to write a `Makefile` or `makefile`.
#### 3.3.2.1 Make gotchas
- Make really cares that the command lines start with a TAB character.
- One way of converting leading spaces into TABs it to use the `unexpand` program:
```bash
mv Makefile Makefile.old
unexpand Makefile.old > Makefile
```
## 3.4 Debugging tools
- The standard debugger is `gdb` and a memory error checker `valgrind`.
### 3.4.1 Debugging in general
- Basic method of all debugging:
  - Know what your program is supposed to do
  - Detect when it doesn't
  - Fix it
### 3.4.2 Assertions
- Every non-trivial C program should include `<assert.h>`, which gives you the `assert` macro.
### 3.4.3 The GNU debugger gdb
- The standard debugger on Linux is called `gdb`.
#### 3.4.3.1 My favorite gdb commands
- `help`
- `run`
- `quit`
- `break`
- `list`
- `next`
- `step`
- `finish`
- `cont`
- `print`
- `display`
- `backtrace` - `bt` - `bt full`
- `set disable-randomization off`
#### 3.4.3.2 Debugging strategies
- In general, the idea behind debugging is that a bad program starts out OK, but after executing for a while it gets confused and starts misbehaving.
- The key to all debugging is knowing what your code is supposed to do.
#### 3.4.3.3 Common application of gdb
##### 3.4.3.3.1 Watching your program run
##### 3.4.3.3.2 Dealing with failed assertions
##### 3.4.3.3.3 Dealing with segmentation faults
##### 3.4.3.3.4 Dealing with infinite loops
##### 3.4.3.3.5 Mysterious variable changes
### 3.4.4 Valgrind
- The valgrind program can be used to detect some (but not all) common errors in C programs that use pointers and dynamic storage allocation.
#### 3.4.4.1 Compilation flags
#### 3.4.4.2 Automated testing
#### 3.4.4.3 Examples of some common valgrind errors
##### 3.4.4.3.1 Uninitialized values
##### 3.4.4.3.2 Bytes definitely lost
##### 3.4.4.3.3 Invalid write or read operations
### 3.4.5 Not recommended: debugging output
## 3.5 Performance tuning
### 3.5.1 Timing under Linux
- `time` measures "real time" (what it sounds like), "user time" (the amount of time the program runs), and "system time" (the amount of time the operating system spends supporting your program, e.g. by loading it from disk and doing I/O). Real time need not be equal to the sum of user time and system time, since the operating system may be simultaneously running other programs.
### 3.5.2 Profiling with `valgrind`
- The problem with `time` is that it only tells you how much time your whole program took, but not where it spent its time.
- If you want to see where your program is spending its time, you need to use a profiler.
- One profiler is: `callgrind`.
  - A tool built into `valgrind`.
- `valgrind` only prints a bit of summary data while executing, to get a full report, we use a separate program `callgrind_annotate`.
- `__strcat_sse3` - is an assembly-language implementation of `strcat` (hence the `.S` in the source file name) that uses the special SSE instructions in the x86 instruction set to speed up copying.
### 3.5.3 Profiling with `gprof`
- If you can't use `valgrind` for profiling, don't like the output you get from it, or are annoyed by the huge slowdown when profiling your program, you may be able to get similar results from an older program `gprof`, which is closely tied to the `gcc` compiler.
- Unlike `valgrind`, which simulates an x86 CPU one machine-code instruction at a time, `gprof` works by having `gcc` add extra code to your program to track function calls and do sampling at runtime to see where your program is spending its time.
  - The cost of this approach is that you get a bit less accuracy. I have also found `gprof` to be tricky to get working right on some operating systems.
- Compiling a C program with the `-pg` option to `gcc`, inserts profiling code that counts how many times each function is called and how long (on average) each call takes.
- Because the profile is not very smart about shared libraries, we also including the `--static` option to force the resulting program to be statically linked.
#### 3.5.3.1 Effect of optimization during compilation
- In compiler construction, strength reduction is a compiler optimization where expensive operations are replaced with equivalent but less expensive operations.
