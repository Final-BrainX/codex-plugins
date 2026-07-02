---
name: brainx
description: Use when the user asks Codex to search, read, summarize, or create BrainX notes through the installed BrainX MCP tools.
---

# BrainX

Use the BrainX MCP tools when the user wants to work with their BrainX workspace notes from Codex.

## Available tools

- `brainx_whoami`: Check the authenticated BrainX MCP identity and granted scopes.
- `brainx_search_notes`: Search the user's BrainX notes with semantic search.
- `brainx_get_note`: Read a single BrainX note by note id.
- `brainx_create_note`: Create a new BrainX note.

## Required setup

The user must have a BrainX MCP API key in `BRAINX_MCP_API_KEY`.
The key should include these scopes:

- `whoami`
- `notes:read`
- `ai:search`
- `notes:write`

If BrainX tools are not available, ask the user to install the BrainX plugin and connect the MCP server:

```bash
codex plugin marketplace add Final-BrainX/codex-plugins --ref main
codex mcp add brainx --url "https://brainx.p-e.kr/mcp" --bearer-token-env-var BRAINX_MCP_API_KEY
```

## Workflow

1. For identity or setup checks, call `brainx_whoami`.
2. For context gathering, call `brainx_search_notes` with a focused query.
3. For exact source details, call `brainx_get_note` on relevant result note ids.
4. For saving useful outputs, call `brainx_create_note` with a clear title, Markdown body, and relevant tags.

Do not ask the user for their API key in chat. If the key is missing, ask them to set `BRAINX_MCP_API_KEY` locally and restart Codex or open a new thread.
