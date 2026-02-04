#!/bin/bash
set -euo pipefail

# Check if Slack credentials are configured via environment variables
# Guides user through setup if not configured

if [[ -z "${SLACK_BOT_TOKEN:-}" ]] || [[ -z "${SLACK_TEAM_ID:-}" ]]; then
  cat >&2 <<'EOF'
{
  "hookSpecificOutput": {
    "permissionDecision": "deny"
  },
  "systemMessage": "Slack plugin requires SLACK_BOT_TOKEN and SLACK_TEAM_ID environment variables.\n\nGuide the user:\n\n1. **Create a Slack App** at https://api.slack.com/apps\n   - Click 'Create New App' > 'From scratch'\n   - Name it (e.g., 'Claude Code') and select workspace\n\n2. **Add Bot Token Scopes** under OAuth & Permissions:\n   - channels:history, channels:read, chat:write\n   - reactions:write, users:read, users.profile:read\n\n3. **Install to Workspace** and copy the Bot User OAuth Token (starts with xoxb-)\n\n4. **Find Team ID** in workspace URL: https://app.slack.com/client/T01234567/...\n\n5. **Set environment variables** in ~/.zshrc or ~/.bashrc:\n   ```\n   export SLACK_BOT_TOKEN=\"xoxb-...\"\n   export SLACK_TEAM_ID=\"T...\"\n   ```\n\n6. Run `source ~/.zshrc` and restart Claude Code"
}
EOF
  exit 2
fi

if [[ ! "${SLACK_BOT_TOKEN}" =~ ^xoxb- ]]; then
  cat >&2 <<'EOF'
{
  "hookSpecificOutput": {
    "permissionDecision": "deny"
  },
  "systemMessage": "SLACK_BOT_TOKEN should start with 'xoxb-'. Check your token in Slack App settings under OAuth & Permissions."
}
EOF
  exit 2
fi

exit 0
