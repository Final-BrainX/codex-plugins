# AGENTS.md

## Project

이 저장소는 BrainX용 공개 Codex 플러그인 마켓플레이스입니다. 사람용 설치/사용 안내는 `README.md`, 마켓플레이스 메타데이터는 `.agents/plugins/marketplace.json`, 실제 플러그인은 `plugins/brainx/` 아래에 있습니다.

## Context Vault

세부 작업 지침, 결정 기록, worklog 규칙은 `vaults/INDEX.md`에서 필요한 문서만 골라 읽습니다. 루트 가이드는 항상 읽어야 할 규칙만 유지합니다.

## Suggested Reading Order

1. `AGENTS.md`
2. `vaults/INDEX.md`
3. 작업과 관련된 task guide, workflow guide, decision note, 대상 코드/문서
4. 반복 수정이나 에이전트 프로세스 개선이 있을 때 `vaults/durable/INDEX.md`

## Always Follow

- 인증/설치 흐름을 바꿀 때는 `plugins/brainx/.mcp.json`, `plugins/brainx/.codex-plugin/plugin.json`, `README.md`, `plugins/brainx/skills/brainx/SKILL.md`, helper script를 함께 확인합니다.
- BrainX plugin은 노트 CRUD뿐 아니라 프로젝트 메모리와 사용자 지식 컨텍스트 소스입니다. skill/README 문구를 줄일 때 이 역할을 제거하지 않습니다.
- credential, OAuth token, service token, API key를 문서나 커밋에 넣지 않습니다.
- `codex mcp add` 또는 `codex mcp login`을 실행하는 helper script는 로컬 Codex 설정을 바꾸므로, 검증 단계에서는 사용자가 명시적으로 요청하지 않는 한 실행하지 않습니다.
- 사람용 설명은 `README.md`에 두고, agent-facing 반복 규칙과 작업 기록은 `vaults/` 아래에 둡니다.

## Completion Checklist

작업이 코드, 문서, 설정, 테스트, 빌드 산출물을 바꾸면 최종 응답 전에 아래를 수행합니다.

1. `vaults/workflows/verification.md`에 맞춰 검증하거나, 실행하지 않은 이유를 기록합니다.
2. `vaults/workflows/worklog.md`에 맞춰 worklog를 남깁니다.
3. 최종 응답에 변경 요약, 검증 결과, worklog 위치를 포함합니다.

## Closing The Loop

같은 수정 지시나 에이전트 프로세스 개선이 반복되면 채팅에만 남기지 않습니다. `vaults/durable/INDEX.md`에 가장 작은 durable improvement로 기록하고, 항상 따라야 하는 규칙이 되었을 때만 루트 가이드나 관련 workflow guide로 승격합니다.

## Git Safety

- 작업 시작 전 `git status -sb`와 관련 diff를 확인합니다.
- `main`/`master`에서 시작하면 기본적으로 `codex/<description>` 브랜치를 만듭니다.
- stage는 의도한 파일만 명시적으로 추가합니다.
- 사용자가 만든 변경은 되돌리지 않습니다.
