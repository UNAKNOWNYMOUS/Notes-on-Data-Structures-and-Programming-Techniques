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
