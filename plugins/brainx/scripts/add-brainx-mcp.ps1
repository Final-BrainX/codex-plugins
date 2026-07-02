param(
  [string]$Url = "https://brainx.p-e.kr/mcp"
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command codex -ErrorAction SilentlyContinue)) {
  throw "Codex CLI was not found on PATH. Install or update Codex, then retry."
}

if (-not $env:BRAINX_MCP_API_KEY) {
  throw "BRAINX_MCP_API_KEY is not set. Create a BrainX MCP API key, set it as an environment variable, then retry."
}

codex mcp add brainx --url $Url --bearer-token-env-var BRAINX_MCP_API_KEY

Write-Host "BrainX MCP server registered."
Write-Host "Open a new Codex thread so the BrainX tools can be discovered."
