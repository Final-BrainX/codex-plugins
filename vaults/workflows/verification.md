# Verification Workflow

BrainX Codex 플러그인 변경 후에는 변경 범위에 맞는 검증만 실행합니다.

## JSON Metadata

`.mcp.json` 또는 `plugin.json`을 바꿨다면 JSON 파싱을 확인합니다.

```powershell
node -e "JSON.parse(require('fs').readFileSync('plugins/brainx/.mcp.json','utf8')); JSON.parse(require('fs').readFileSync('plugins/brainx/.codex-plugin/plugin.json','utf8')); console.log('json ok')"
```

## Auth Flow Consistency

인증 방식을 바꿨다면 숨김 파일까지 포함해 레거시 문자열이 남았는지 확인합니다.

```powershell
$matches = rg --hidden -n "BRAINX_MCP_API_KEY|bearer_token_env_var|--bearer-token-env-var" README.md plugins/brainx; if ($LASTEXITCODE -eq 1) { 'legacy strings absent including hidden files'; exit 0 }; if ($LASTEXITCODE -eq 0) { $matches; exit 1 }; exit $LASTEXITCODE
```

OAuth 흐름이 문서와 script에 반영됐는지도 확인합니다.

```powershell
rg --hidden -n "oauth_resource|--oauth-resource|codex mcp login brainx" README.md plugins/brainx
```

## Helper Scripts

helper script는 로컬 Codex 설정을 변경하므로 기본 검증에서는 실행하지 않습니다. 문법만 확인합니다.

```powershell
if (Test-Path 'C:\Program Files\Git\bin\bash.exe') { & 'C:\Program Files\Git\bin\bash.exe' -n plugins/brainx/scripts/add-brainx-mcp.sh } elseif (Test-Path 'C:\Program Files\Git\usr\bin\bash.exe') { & 'C:\Program Files\Git\usr\bin\bash.exe' -n plugins/brainx/scripts/add-brainx-mcp.sh } else { Write-Error 'Git Bash not found'; exit 1 }
```

```powershell
$tokens = $null; $parseErrors = $null; $null = [System.Management.Automation.Language.Parser]::ParseFile((Resolve-Path 'plugins/brainx/scripts/add-brainx-mcp.ps1'), [ref]$tokens, [ref]$parseErrors); if ($parseErrors.Count) { $parseErrors | ForEach-Object { $_.Message }; exit 1 }; 'powershell syntax ok'
```

## Git Hygiene

커밋 전 whitespace 문제와 stage 범위를 확인합니다.

```powershell
git diff --cached --check
git status -sb
git diff --cached --stat
```
