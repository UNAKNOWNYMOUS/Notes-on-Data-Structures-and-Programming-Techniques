#!/usr/bin/env bash
cd "$(dirname "$0")"
set -u

missing=0
check() {
  local cmd="$1"
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "OK: $cmd -> $(command -v "$cmd")"
  else
    echo "MISSING: $cmd"
    missing=$((missing+1))
  fi
}

check gcc
check make
check gdb
check git

if command -v valgrind >/dev/null 2>&1; then
  echo "OK: valgrind -> $(command -v valgrind)"
else
  echo "WARNING: valgrind missing. Install it if you are on Linux."
fi

if [ -f environment.md ] && [ -s environment.md ]; then
  echo "OK: environment.md exists and is not empty"
else
  echo "MISSING: create 01_environment_check/environment.md"
  missing=$((missing+1))
fi

if [ "$missing" -ne 0 ]; then
  exit 1
fi
