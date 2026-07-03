# Worklog Updates

작업이 코드, 문서, 설정, 테스트, 빌드 산출물을 바꾸면 종료 전에 worklog를 남깁니다.

별도 worklog 채널이 없으면 월별 fallback 파일 `vaults/worklogs/YYYY-MM.md`에 append합니다. 각 entry heading은 로컬 시간 기준 분 단위 형식을 사용합니다.

```md
## YYYY-MM-DD HH:mm - <짧은 제목>

완료: <작업 요약>
아티팩트: <핵심 파일/문서/PR 링크>
검증: <실행한 검증 또는 미실행 사유>
```

최종 응답에는 변경 요약, 검증 결과, worklog 위치를 포함합니다.
