# Durable Improvements

반복되는 에이전트 수정 지시와 재사용 가능한 프로세스 개선을 기록합니다. 한 번성 작업 상태나 일반 변경 요약은 `vaults/worklogs/`에 남깁니다.

## Writing Rules

- 같은 피드백이 반복되거나, 다음 세션에서도 반드시 도움이 되는 작은 규칙만 추가합니다.
- 루트 `AGENTS.md`에는 항상 지켜야 하는 짧은 규칙만 승격합니다.
- 작업별 세부 절차는 관련 workflow guide나 decision note로 옮깁니다.
- 중복 규칙이 생기면 하나의 source of truth만 남깁니다.

## Entries

- `2026-07-03`: BrainX plugin은 context source 역할을 유지해야 합니다. skill/README 문구를 줄일 때도 이전 결정, 요구사항, 회의록, 프로젝트 메모리 검색 트리거를 제거하지 않습니다.
- `2026-07-03`: 팀원 설치 안내는 기본 브랜치 `main` 기준이어야 합니다. feature branch에만 push하면 `codex plugin marketplace add Final-BrainX/codex-plugins --ref main` 사용자가 변경을 받지 못합니다.
