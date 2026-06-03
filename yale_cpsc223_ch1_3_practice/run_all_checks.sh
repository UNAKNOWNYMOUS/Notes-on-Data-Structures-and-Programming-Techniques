#!/usr/bin/env bash
cd "$(dirname "$0")"
set -u

pass=0
fail=0
run_check() {
  local name="$1"
  shift
  echo "==> $name"
  if "$@"; then
    echo "PASS: $name"
    pass=$((pass+1))
  else
    echo "FAIL: $name"
    fail=$((fail+1))
  fi
  echo
}

run_check "environment" bash 01_environment_check/check_env.sh
run_check "shell/redirection" bash 02_shell_redirection/check.sh
run_check "gcc/make" bash 03_gcc_make/check.sh
run_check "debugging" bash 04_debugging_gdb_valgrind/check.sh
run_check "git lab" bash 05_git_lab/check_git.sh

echo "Summary: $pass passed, $fail failed"
if [ "$fail" -ne 0 ]; then
  exit 1
fi
