# BrainX Codex Plugins

BrainX용 공개 Codex 플러그인 마켓플레이스입니다.

`brainx` 플러그인은 Codex가 BrainX MCP 서버를 통해 사용자의 BrainX 워크스페이스 노트에 접근할 수 있게 해줍니다.

```text
https://brainx.p-e.kr/mcp
```

## 할 수 있는 일

- Codex에서 BrainX 노트를 검색합니다.
- Codex가 정확한 맥락이 필요할 때 특정 노트를 읽습니다.
- 초안, 요약, 계획을 새 BrainX 노트로 저장합니다.
- Codex가 어떤 BrainX MCP identity로 연결되어 있는지 확인합니다.

## 준비물

- Codex app 또는 Codex CLI
- BrainX 계정
- 아래 scope가 포함된 BrainX MCP API key
  - `whoami`
  - `notes:read`
  - `ai:search`
  - `notes:write`

API key는 개인 비밀값입니다. 채팅, 커밋, 스크린샷, 이슈에 붙여넣지 마세요.

## 설치

Codex에 BrainX 플러그인 마켓플레이스를 추가합니다.

```bash
codex plugin marketplace add Final-BrainX/codex-plugins --ref main
```

그 다음 Codex의 플러그인 목록을 열고 `BrainX Codex Plugins` 마켓플레이스에서 `BrainX`를 설치합니다.

설치 후에는 새 Codex thread를 열어주세요.

## API key 설정

로컬 환경변수에 `BRAINX_MCP_API_KEY`를 설정합니다.

PowerShell:

```powershell
setx BRAINX_MCP_API_KEY "replace-with-your-brainx-mcp-api-key"
```

macOS/Linux shell:

```bash
export BRAINX_MCP_API_KEY="replace-with-your-brainx-mcp-api-key"
```

환경변수를 설정한 뒤에는 Codex를 다시 시작하거나 새 터미널을 열어주세요.

## MCP 수동 연결

플러그인을 설치했는데 BrainX 도구가 보이지 않으면 MCP 서버를 직접 등록할 수 있습니다.

```bash
codex mcp add brainx --url "https://brainx.p-e.kr/mcp" --bearer-token-env-var BRAINX_MCP_API_KEY
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

## 보안

- 이 저장소에는 API key, service token, 사용자 인증 정보가 들어 있지 않습니다.
- 공개 플러그인은 로컬 환경변수 `BRAINX_MCP_API_KEY`를 사용합니다.
- BrainX MCP 서버는 각 도구 호출마다 API key scope를 확인합니다.
