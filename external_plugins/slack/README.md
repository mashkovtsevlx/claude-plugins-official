# Slack Plugin for Claude Code

This plugin integrates Slack with Claude Code, allowing you to post messages, reply to threads, list channels, read history, and manage reactions directly from your coding environment.

## Quick Start

Just try to use Slack (e.g., "list my Slack channels") and Claude will guide you through setup if credentials aren't configured.

## Setup

### 1. Create a Slack App

1. Go to [api.slack.com/apps](https://api.slack.com/apps)
2. Click **Create New App** → **From scratch**
3. Name your app (e.g., "Claude Code") and select your workspace
4. Click **Create App**

### 2. Configure Bot Token Scopes

1. In the left sidebar, go to **OAuth & Permissions**
2. Scroll to **Scopes** → **Bot Token Scopes**
3. Add the following scopes:
   - `channels:history` - View messages in public channels
   - `channels:read` - View basic channel info
   - `chat:write` - Post messages
   - `reactions:write` - Add reactions to messages
   - `users:read` - View users and their basic info
   - `users.profile:read` - View user profile details

### 3. Install App to Workspace

1. Scroll to the top of **OAuth & Permissions**
2. Click **Install to Workspace**
3. Review permissions and click **Allow**
4. Copy the **Bot User OAuth Token** (starts with `xoxb-`)

### 4. Get Your Team ID

Your Slack Team ID (Workspace ID) can be found in:
- Your workspace URL: `https://app.slack.com/client/T01234567/...` (the `T01234567` part)
- Or go to your workspace settings → "About this workspace"

### 5. Set Environment Variables

Add these lines to your shell profile (`~/.zshrc` or `~/.bashrc`):

```bash
export SLACK_BOT_TOKEN="xoxb-your-token-here"
export SLACK_TEAM_ID="T01234567"
```

Then reload your shell:

```bash
source ~/.zshrc  # or source ~/.bashrc
```

### 6. Restart Claude Code

After setting the environment variables, restart Claude Code for changes to take effect.

## Available Tools

Once configured, the following tools are available:

- **slack_list_channels** - List public channels in the workspace
- **slack_post_message** - Post a new message to a channel
- **slack_reply_to_thread** - Reply to an existing message thread
- **slack_add_reaction** - Add an emoji reaction to a message
- **slack_get_channel_history** - Read recent messages from a channel
- **slack_get_thread_replies** - Get all replies in a thread
- **slack_get_users** - List users in the workspace
- **slack_get_user_profile** - Get detailed profile for a user

## Example Usage

```
> List the channels in my Slack workspace

> Post "Build completed successfully!" to #engineering

> Get the last 10 messages from #general

> Reply to the latest thread in #bugs with "I'll take a look at this"
```

## Troubleshooting

### "Environment variables not set" error
- Check that `SLACK_BOT_TOKEN` and `SLACK_TEAM_ID` are exported in your shell profile
- Run `echo $SLACK_BOT_TOKEN` to verify the variable is set
- Restart Claude Code after setting variables

### "Invalid token" errors
- Verify your `SLACK_BOT_TOKEN` starts with `xoxb-`
- Make sure you copied the full token without extra spaces
- Check the token hasn't been revoked in Slack App settings

### "Channel not found" errors
- The bot must be invited to private channels before it can access them
- Use `/invite @YourBotName` in the channel

### "Missing scope" errors
- Return to OAuth & Permissions in your Slack App settings
- Add any missing scopes listed above
- Reinstall the app to your workspace to apply new scopes

## More Information

This plugin uses the official MCP Slack server from the Model Context Protocol project.

- [MCP Slack Server Documentation](https://github.com/modelcontextprotocol/servers/tree/main/src/slack)
- [Slack API Documentation](https://api.slack.com/docs)
