param(
  [string]$Url = "https://brainx.p-e.kr/mcp",
  [string]$OAuthResource = "https://brainx.p-e.kr/mcp",
  [string]$Scopes = "whoami,notes:read,ai:search,notes:write"
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command codex -ErrorAction SilentlyContinue)) {
  throw "Codex CLI was not found on PATH. Install or update Codex, then retry."
}

codex mcp add brainx --url $Url --oauth-resource $OAuthResource
codex mcp login brainx --scopes $Scopes

Write-Host "BrainX MCP server registered and OAuth login completed."
Write-Host "Open a new Codex thread so the BrainX tools can be discovered."
