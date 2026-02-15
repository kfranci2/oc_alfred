#!/bin/bash
# Auto-commit workspace changes to GitHub

cd /data/.openclaw/workspace || exit 1

# Add all tracked files and new files in tracked directories
git add -A .

# Check if there are changes to commit
if git diff --cached --quiet; then
  echo "No changes to commit"
  exit 0
fi

# Commit with timestamp
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S %Z')
git commit -m "Auto-commit: ${TIMESTAMP}"

# Push to GitHub
git push origin main

echo "Changes committed and pushed at ${TIMESTAMP}"
