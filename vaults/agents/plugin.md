# BrainX Plugin Guide

## 파일

- `plugins/brainx/.codex-plugin/plugin.json`: Codex plugin metadata, marketplace UI 문구, default prompts를 정의합니다.
- `plugins/brainx/.mcp.json`: BrainX remote MCP server 설정을 정의합니다.
- `plugins/brainx/skills/brainx/SKILL.md`: Codex agent가 BrainX MCP tools를 언제 어떻게 사용할지 안내합니다.
- `plugins/brainx/scripts/`: 수동 MCP 등록과 OAuth login helper script입니다.
- `README.md`: 사람과 팀원이 보는 설치/사용 안내입니다.

## 컨텍스트 소스 동작

BrainX plugin은 단순 노트 CRUD가 아니라 프로젝트 메모리와 사용자 지식 컨텍스트 소스입니다. skill 문구를 수정할 때 다음 흐름을 유지합니다.

1. setup/identity 확인은 `brainx_whoami`.
2. 맥락 탐색은 `brainx_search_notes`.
3. 정확한 근거 확인은 `brainx_get_note`.
4. 저장 요청이 있을 때만 `brainx_create_note`.

원문 노트 전체를 불필요하게 노출하지 말고 현재 작업에 필요한 맥락만 요약하도록 안내합니다.

## 검증

manifest나 MCP config 변경 후:

```powershell
Get-Content -Raw -LiteralPath 'plugins\brainx\.codex-plugin\plugin.json' | ConvertFrom-Json | Out-Null
Get-Content -Raw -LiteralPath 'plugins\brainx\.mcp.json' | ConvertFrom-Json | Out-Null
```

skill 변경 후 frontmatter 확인:

```powershell
$content = Get-Content -Raw -LiteralPath 'plugins\brainx\skills\brainx\SKILL.md'
if ($content -notmatch '(?s)^---\s*\r?\nname:\s*brainx\s*\r?\ndescription:\s*.+?\r?\n---') { throw 'SKILL.md frontmatter missing name/description' }
```
