#!/bin/bash
DIFF=$(git diff --staged)
if [ -z "$DIFF" ]; then
echo "No staged changes." >&2
exit 1
fi

INSTRUCTIONS="Generate a concise git commit message for these staged changes. Use conventional commit format (type: description). Output only the commit message, nothing else."

MSG=$(echo "$DIFF" | claude -p $INSTRUCTIONS)

git commit --edit -m "$MSG"
