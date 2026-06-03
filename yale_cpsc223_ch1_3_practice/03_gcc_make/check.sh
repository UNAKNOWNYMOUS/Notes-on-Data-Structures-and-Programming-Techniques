#!/usr/bin/env bash
cd "$(dirname "$0")"
set -u
fail=0

make clean >/dev/null 2>&1 || true
if ! make >/tmp/yale_make_output.txt 2>&1; then
  echo "FAIL: make failed"
  cat /tmp/yale_make_output.txt
  exit 1
fi

if [ ! -x ./hello ]; then
  echo "FAIL: ./hello was not built"
  fail=1
else
  got=$(./hello)
  if [ "$got" = "Hello, C systems path!" ]; then
    echo "OK: hello output"
  else
    echo "FAIL: hello output was: [$got]"
    fail=1
  fi
fi

if [ ! -x ./repeat ]; then
  echo "FAIL: ./repeat was not built"
  fail=1
else
  expected=$'systems\nsystems\nsystems'
  got=$(./repeat systems 3)
  if [ "$got" = "$expected" ]; then
    echo "OK: repeat normal case"
  else
    echo "FAIL: repeat output was: [$got]"
    fail=1
  fi
  if ./repeat word 0 >/tmp/repeat_out.txt 2>/tmp/repeat_err.txt; then
    echo "FAIL: repeat should fail for count 0"
    fail=1
  else
    echo "OK: repeat rejects count 0"
  fi
fi

exit "$fail"
