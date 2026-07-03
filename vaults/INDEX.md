# Vault Index

이 디렉터리는 agent-facing 문서의 라우터입니다. 필요한 문서만 열어 컨텍스트를 작게 유지합니다.

- `vaults/workflows/verification.md`: BrainX Codex 플러그인의 설정/문서 변경을 검증하는 명령 모음입니다. 인증, MCP 설정, helper script, README를 바꿀 때 읽습니다.
- `vaults/agents/plugin.md`: BrainX plugin의 manifest, MCP config, skill, README 유지보수 규칙입니다. 플러그인 문구, context source 동작, tool 안내를 바꿀 때 읽습니다.
- `vaults/workflows/worklog.md`: 작업 종료 시 worklog를 남기는 규칙입니다. 코드/문서/설정 변경을 완료할 때 읽습니다.
- `vaults/worklogs/YYYY-MM.md`: 월별 파일 기반 worklog fallback입니다. 별도 worklog 채널이 없을 때 완료 기록을 여기에 남깁니다.
- `vaults/decisions/2026-07-03-brainx-oauth-mcp.md`: BrainX MCP 인증 방식을 API key에서 OAuth로 전환한 결정 기록입니다. 인증/설치/배포 흐름을 다시 바꿀 때 읽습니다.
- `vaults/durable/INDEX.md`: 반복된 에이전트 수정 지시와 재사용 가능한 개선 규칙을 모으는 durable improvement index입니다. 같은 피드백이 반복될 때 읽고 갱신합니다.

주요 코드/문서 위치:

- `README.md`: 사람용 설치, 사용, 보안 안내입니다.
- `plugins/brainx/.mcp.json`: Codex MCP 서버 연결 설정입니다.
- `plugins/brainx/.codex-plugin/plugin.json`: 플러그인 marketplace metadata입니다.
- `plugins/brainx/skills/brainx/SKILL.md`: 설치된 BrainX skill이 에이전트에게 제공하는 작업 안내입니다.
- `plugins/brainx/scripts/`: 수동 MCP 연결 helper script입니다.
