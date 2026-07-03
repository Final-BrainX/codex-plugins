# BrainX MCP OAuth 전환

Date: 2026-07-03

## Context

BrainX Codex 플러그인은 초기에는 `BRAINX_MCP_API_KEY` 환경변수와 `bearer_token_env_var` 기반으로 MCP 서버에 연결했습니다. 서버 측에는 OAuth protected resource metadata, authorization server metadata, dynamic client registration, token endpoint가 준비되어 있어 플러그인 레포의 인증 설정과 문서가 OAuth 흐름으로 전환되어야 했습니다.

## Decision

BrainX MCP 연결은 API key 대신 OAuth를 기본 인증 방식으로 사용합니다.

- `plugins/brainx/.mcp.json`은 `type: "http"`와 `oauth_resource: "https://brainx.p-e.kr/mcp"`를 사용합니다.
- 수동 연결은 `codex mcp add brainx --url "https://brainx.p-e.kr/mcp" --oauth-resource "https://brainx.p-e.kr/mcp"` 후 `codex mcp login brainx --scopes whoami,notes:read,ai:search,notes:write`를 실행합니다.
- README, plugin metadata, BrainX skill 안내, helper script에는 API key 발급/환경변수 안내를 남기지 않습니다.

## Consequences

- 사용자는 로컬 환경변수 대신 Codex OAuth login flow로 인증합니다.
- helper script는 MCP 서버 등록 후 OAuth login을 이어서 실행합니다.
- 검증 시 helper script를 실제 실행하면 로컬 Codex 설정이 변경되므로 기본 검증은 JSON 파싱, 레거시 문자열 검색, script syntax check로 제한합니다.

## Links

- `README.md`
- `plugins/brainx/.mcp.json`
- `plugins/brainx/.codex-plugin/plugin.json`
- `plugins/brainx/skills/brainx/SKILL.md`
- `plugins/brainx/scripts/add-brainx-mcp.ps1`
- `plugins/brainx/scripts/add-brainx-mcp.sh`
