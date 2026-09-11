#!/usr/bin/env bash
# Hermes Git Larp Script
# Runs 20 commits with random python/html/c files so the GitHub commit page is solid green

set -e

git init 2>/dev/null || true
git config user.name "Hermes Bot"
git config user.email "hermes@nousresearch.com"

for i in $(seq 1 20); do
  file_type=$((RANDOM % 3))
  case $file_type in
    0) ext="py"; content="print('commit $i')";;
    1) ext="html"; content="<html><body>commit $i</body></html>";;
    2) ext="c"; content="#include <stdio.h>\nint main() { printf('commit %d\n', $i); return 0; }";;
  esac
  echo "$content" > "file_$i.$ext"
  git add "file_$i.$ext"
  git commit -m "feat: random $ext file $i"
done

echo "All 20 commits complete. GitHub contributions should show solid green."