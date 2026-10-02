#!/bin/bash
# Block edits/writes while on main or master. Enforces "never commit to main".
BRANCH=$(git -C "${CLAUDE_PROJECT_DIR:-$PWD}" rev-parse --abbrev-ref HEAD 2>/dev/null)
if [[ "$BRANCH" == "main" || "$BRANCH" == "master" ]]; then
  echo "Refusing to edit while on '$BRANCH'. Create a feature branch first." >&2
  exit 2
fi
exit 0