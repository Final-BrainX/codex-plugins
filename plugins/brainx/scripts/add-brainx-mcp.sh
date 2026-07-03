#!/usr/bin/env sh
set -eu

URL="${BRAINX_MCP_URL:-https://brainx.p-e.kr/mcp}"
OAUTH_RESOURCE="${BRAINX_MCP_OAUTH_RESOURCE:-https://brainx.p-e.kr/mcp}"
SCOPES="${BRAINX_MCP_SCOPES:-whoami,notes:read,ai:search,notes:write}"

if ! command -v codex >/dev/null 2>&1; then
  echo "Codex CLI was not found on PATH. Install or update Codex, then retry." >&2
  exit 1
fi

codex mcp add brainx --url "$URL" --oauth-resource "$OAUTH_RESOURCE"
codex mcp login brainx --scopes "$SCOPES"

echo "BrainX MCP server registered and OAuth login completed."
echo "Open a new Codex thread so the BrainX tools can be discovered."
