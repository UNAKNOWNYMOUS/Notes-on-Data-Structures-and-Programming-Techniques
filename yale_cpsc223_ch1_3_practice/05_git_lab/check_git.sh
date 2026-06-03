#!/usr/bin/env bash
cd "$(dirname "$0")"
set -u
fail=0

if [ ! -d .git ]; then
  echo "FAIL: .git directory not found. Run git init in 05_git_lab."
  exit 1
fi

if [ ! -s notes.md ]; then
  echo "FAIL: notes.md missing or empty"
  fail=1
fi

commits=$(git rev-list --count HEAD 2>/dev/null || echo 0)
if [ "$commits" -ge 3 ]; then
  echo "OK: at least three commits ($commits)"
else
  echo "FAIL: expected at least three commits, found $commits"
  fail=1
fi

git status --short
exit "$fail"
