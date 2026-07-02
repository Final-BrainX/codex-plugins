# BrainX Codex Plugins

Public Codex plugin marketplace for BrainX.

The `brainx` plugin connects Codex to your BrainX workspace notes through the BrainX MCP server at:

```text
https://brainx.p-e.kr/mcp
```

## What You Can Do

- Search your BrainX notes from Codex.
- Read a note when Codex needs exact source context.
- Create new BrainX notes from drafts, summaries, or plans.
- Check which BrainX MCP identity Codex is using.

## Requirements

- Codex app or Codex CLI.
- A BrainX account.
- A BrainX MCP API key with these scopes:
  - `whoami`
  - `notes:read`
  - `ai:search`
  - `notes:write`

Keep your API key private. Do not paste it into chats, commits, screenshots, or issue reports.

## Install

Add this marketplace to Codex:

```bash
codex plugin marketplace add Final-BrainX/codex-plugins --ref main
```

Then open the Codex plugin directory, choose the `BrainX Codex Plugins` marketplace, and install `BrainX`.

After installing, start a new Codex thread.

## Set Your API Key

Set `BRAINX_MCP_API_KEY` in your local environment.

PowerShell:

```powershell
setx BRAINX_MCP_API_KEY "replace-with-your-brainx-mcp-api-key"
```

macOS/Linux shell:

```bash
export BRAINX_MCP_API_KEY="replace-with-your-brainx-mcp-api-key"
```

Restart Codex or open a new terminal after setting the variable.

## Fallback MCP Setup

If the plugin is installed but BrainX tools do not appear, register the MCP server directly:

```bash
codex mcp add brainx --url "https://brainx.p-e.kr/mcp" --bearer-token-env-var BRAINX_MCP_API_KEY
```

You can also run the helper script from a local clone of this repository:

PowerShell:

```powershell
.\plugins\brainx\scripts\add-brainx-mcp.ps1
```

macOS/Linux shell:

```bash
sh ./plugins/brainx/scripts/add-brainx-mcp.sh
```

## Tools

The BrainX MCP server exposes:

- `brainx_whoami`
- `brainx_search_notes`
- `brainx_get_note`
- `brainx_create_note`

## Example Prompts

```text
Search my BrainX notes for the latest MCP implementation details.
```

```text
Create a BrainX note from this draft and tag it as meeting-notes.
```

```text
Find notes about FastAPI and summarize the key decisions.
```

## Security

- This repository does not contain API keys, service tokens, or user credentials.
- The public plugin uses `BRAINX_MCP_API_KEY` from your local environment.
- The BrainX MCP server enforces your API key scopes for each tool call.
