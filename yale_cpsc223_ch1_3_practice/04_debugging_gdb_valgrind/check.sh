#!/usr/bin/env bash
cd "$(dirname "$0")"
set -u
fail=0

if [ ! -s debug_notes.md ]; then
  echo "FAIL: debug_notes.md is missing or empty"
  fail=1
fi

if ! gcc -std=c11 -Wall -Wextra -pedantic -g average_buggy.c -o average >/tmp/avg_build.txt 2>&1; then
  echo "FAIL: build failed"
  cat /tmp/avg_build.txt
  exit 1
fi

check_output() {
  local expected="$1"
  shift
  local got
  got=$(./average "$@")
  if [ "$got" = "$expected" ]; then
    echo "OK: average $*"
  else
    echo "FAIL: average $* -> [$got], expected [$expected]"
    fail=1
  fi
}

check_output "average: 2.00" 1 2 3
check_output "average: 25.00" 10 20 30 40
check_output "average: -2.00" -1 -2 -3

if ./average >/tmp/avg_noargs_out.txt 2>/tmp/avg_noargs_err.txt; then
  echo "FAIL: no-argument case should return nonzero"
  fail=1
else
  echo "OK: no-argument case returns nonzero"
fi

if command -v valgrind >/dev/null 2>&1; then
  if valgrind --leak-check=full --error-exitcode=99 ./average 1 2 3 >/tmp/avg_valgrind_out.txt 2>/tmp/avg_valgrind_err.txt; then
    echo "OK: Valgrind found no errors/leaks"
  else
    echo "FAIL: Valgrind found errors/leaks"
    tail -40 /tmp/avg_valgrind_err.txt
    fail=1
  fi
else
  echo "SKIP: Valgrind not installed"
fi

exit "$fail"
