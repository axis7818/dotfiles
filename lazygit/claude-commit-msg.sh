#!/bin/bash
echo "Collecting staged changes..." >&2
DIFF=$(git diff --staged)
if [ -z "$DIFF" ]; then
  echo "No staged changes." >&2
  exit 1
fi

INSTRUCTIONS="Generate a concise git commit message for these staged changes. Use conventional commit format (type: description). Output only the commit message, nothing else since your output will be set directly as the commit message."

echo "" >&2
echo "Instructions: $INSTRUCTIONS" >&2
echo "" >&2
echo "Generating commit message with Claude..." >&2
MSG=$(echo "$DIFF" | claude -p "$INSTRUCTIONS")
echo "" >&2
echo "Commit message: $MSG" >&2
echo "" >&2

git commit --edit -m "$MSG"
