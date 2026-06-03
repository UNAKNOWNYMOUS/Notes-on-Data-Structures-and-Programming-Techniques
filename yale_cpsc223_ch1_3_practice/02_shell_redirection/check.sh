#!/usr/bin/env bash
cd "$(dirname "$0")"
set -u

fail=0
compare() {
  local got="$1"
  local exp="$2"
  if [ ! -f "$got" ]; then
    echo "MISSING: $got"
    fail=1
    return
  fi
  if diff -u "$exp" "$got"; then
    echo "OK: $got"
  else
    echo "DIFF FAILED: $got"
    fail=1
  fi
}

compare work/names_sorted.txt expected/names_sorted.txt
compare work/error_lines.txt expected/error_lines.txt
compare work/warnings_and_errors.txt expected/warnings_and_errors.txt
compare work/unique_words.txt expected/unique_words.txt

if [ ! -f work/line_counts.txt ]; then
  echo "MISSING: work/line_counts.txt"
  fail=1
else
  for f in data/names.txt data/app.log data/words.txt; do
    if grep -q "$f" work/line_counts.txt; then
      echo "OK: line count includes $f"
    else
      echo "MISSING line count for $f"
      fail=1
    fi
  done
fi

exit "$fail"
