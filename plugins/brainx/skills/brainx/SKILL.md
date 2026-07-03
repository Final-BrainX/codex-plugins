---
name: brainx
description: Use when the user asks Codex to search, read, summarize, create, or use BrainX notes as context for prior decisions, requirements, meeting notes, project memory, or user knowledge.
---

# BrainX

Use the BrainX MCP tools when the user wants to work with their BrainX workspace notes from Codex, or when a task may depend on prior decisions, requirements, meeting notes, product context, project memory, or user knowledge stored in BrainX.

BrainX is a context source. Do not treat it only as a note CRUD tool. When BrainX context is relevant, gather focused evidence before making assumptions.

## Available tools

- `brainx_whoami`: Check the authenticated BrainX MCP identity and granted scopes.
- `brainx_search_notes`: Search the user's BrainX notes with semantic search.
- `brainx_get_note`: Read a single BrainX note by note id.
- `brainx_create_note`: Create a new BrainX note.

## Required setup

The user must have installed the BrainX plugin and signed in to the BrainX MCP server with OAuth.
The OAuth login should include these scopes:

- `whoami`
- `notes:read`
- `ai:search`
- `notes:write`

If BrainX tools are not available, ask the user to install the BrainX plugin and connect the MCP server:

```bash
codex plugin marketplace add Final-BrainX/codex-plugins --ref main
codex mcp add brainx --url "https://brainx.p-e.kr/mcp" --oauth-resource "https://brainx.p-e.kr/mcp"
codex mcp login brainx --scopes whoami,notes:read,ai:search,notes:write
```

## Workflow

1. For identity or setup checks, call `brainx_whoami`.
2. For context gathering, call `brainx_search_notes` with a focused query based on the user's task.
3. For exact source details, call `brainx_get_note` on relevant result note ids.
4. For saving useful outputs, call `brainx_create_note` only when the user asks to save, capture, or publish the result to BrainX.

## Context handling

- Search BrainX before making assumptions when the task references previous decisions, requirements, meetings, specs, roadmaps, product behavior, architecture context, or project memory.
- Summarize only the relevant context. Do not paste full private notes unless the user explicitly asks for the full note.
- When results are ambiguous, read the most relevant notes and state what context came from BrainX.
- Keep BrainX-derived context scoped to the current task and avoid exposing unrelated personal or workspace information.

Do not ask the user for OAuth tokens or credentials in chat. If authentication is missing, ask them to run the OAuth login command locally and restart Codex or open a new thread.
