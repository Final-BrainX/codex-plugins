# BrainX Codex Plugins

BrainX용 공개 Codex 플러그인 마켓플레이스입니다.

`brainx` 플러그인은 Codex가 BrainX MCP 서버를 통해 사용자의 BrainX 워크스페이스 노트에 접근할 수 있게 해줍니다.
설치 후 새 Codex thread를 열면 BrainX skill이 프로젝트 메모리와 사용자 지식 컨텍스트 소스로 동작합니다.

```text
https://brainx.p-e.kr/mcp
```

## 할 수 있는 일

- Codex에서 BrainX 노트를 검색합니다.
- Codex가 정확한 맥락이 필요할 때 특정 노트를 읽습니다.
- 이전 결정, 요구사항, 회의록, 프로젝트 메모리를 BrainX에서 찾아 현재 작업 컨텍스트로 요약합니다.
- 초안, 요약, 계획을 새 BrainX 노트로 저장합니다.
- Codex가 어떤 BrainX MCP identity로 연결되어 있는지 확인합니다.

## 준비물

- Codex app 또는 Codex CLI
- BrainX 계정

## 설치

Codex에 BrainX 플러그인 마켓플레이스를 추가합니다.

```bash
codex plugin marketplace add Final-BrainX/codex-plugins --ref main
```

그 다음 Codex의 플러그인 목록을 열고 `BrainX Codex Plugins` 마켓플레이스에서 `BrainX`를 설치합니다.

설치 후 BrainX MCP에 OAuth로 로그인합니다.

```bash
codex mcp login brainx --scopes whoami,notes:read,ai:search,notes:write
```

로그인 후에는 새 Codex thread를 열어주세요.

## 컨텍스트 주입 방식

BrainX 플러그인은 설치만으로 모든 요청마다 노트를 무조건 검색하지 않습니다.

새 Codex thread에서 BrainX skill이 로드되면, Codex는 BrainX 관련 요청이나 이전 결정, 요구사항, 회의록, 프로젝트 맥락이 필요한 작업에서 BrainX MCP tools를 사용해 관련 노트를 검색하고 필요한 노트만 읽습니다.
에이전트는 원문 노트 전체를 불필요하게 노출하지 않고 현재 작업에 필요한 맥락만 요약하도록 안내되어 있습니다.

## MCP 수동 연결

플러그인을 설치했는데 BrainX 도구가 보이지 않으면 MCP 서버를 직접 등록할 수 있습니다.

```bash
codex mcp add brainx --url "https://brainx.p-e.kr/mcp" --oauth-resource "https://brainx.p-e.kr/mcp"
codex mcp login brainx --scopes whoami,notes:read,ai:search,notes:write
```

이 저장소를 로컬에 clone했다면 helper script를 실행해도 됩니다.

PowerShell:

```powershell
.\plugins\brainx\scripts\add-brainx-mcp.ps1
```

macOS/Linux shell:

```bash
sh ./plugins/brainx/scripts/add-brainx-mcp.sh
```

## 제공 도구

BrainX MCP 서버는 아래 도구를 제공합니다.

- `brainx_whoami`
- `brainx_search_notes`
- `brainx_get_note`
- `brainx_create_note`

## 예시 프롬프트

```text
내 BrainX 노트에서 MCP 구현 관련 내용을 찾아줘.
```

```text
이 초안을 BrainX 노트로 저장하고 meeting-notes 태그를 붙여줘.
```

```text
FastAPI 관련 노트를 찾아서 핵심 결정사항을 요약해줘.
```

```text
Use my BrainX notes as context for this task.
```

```text
Search BrainX for prior decisions before implementing.
```

```text
Find related BrainX requirements and summarize the relevant context.
```

## 보안

- 이 저장소에는 service token, 사용자 인증 정보, OAuth token이 들어 있지 않습니다.
- Codex는 BrainX OAuth 로그인 후 발급된 token으로 MCP 서버에 연결합니다.
- BrainX MCP 서버는 각 도구 호출마다 OAuth token scope를 확인합니다.
