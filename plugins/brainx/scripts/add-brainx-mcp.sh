#!/usr/bin/env sh
set -eu

URL="${BRAINX_MCP_URL:-https://brainx.p-e.kr/mcp}"

if ! command -v codex >/dev/null 2>&1; then
  echo "Codex CLI was not found on PATH. Install or update Codex, then retry." >&2
  exit 1
fi

if [ -z "${BRAINX_MCP_API_KEY:-}" ]; then
  echo "BRAINX_MCP_API_KEY is not set. Create a BrainX MCP API key, set it as an environment variable, then retry." >&2
  exit 1
fi

codex mcp add brainx --url "$URL" --bearer-token-env-var BRAINX_MCP_API_KEY

echo "BrainX MCP server registered."
echo "Open a new Codex thread so the BrainX tools can be discovered."
