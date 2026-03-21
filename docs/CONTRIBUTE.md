# 기여

Lune 기반의 빠르고 가벼운 알고리즘 채점(Online Judge) 시스템을 지향합니다. 여러분의 기여를 환영합니다!

## 버그 리포트 & 기능 제안
- 이슈(Issue) 탭을 통해 발견된 버그(예: 특정 OS에서의 경로 파싱 에러, 프로세스 누수 등)를 제보해 주세요.
- 새로운 기능(예: 메모리 제한 강제 구현, 샌드박스 도입) 제안 시 상세한 구현 방향을 함께 적어주시면 좋습니다.

## 코드 스타일 및 컨벤션
1. **Luau Strict Mode 권장**: 가급적 타입 어노테이션(`:: type`) 또는 `assert`를 활용하여 언어 서버에서 타입 에러가 발생하지 않도록 코드를 작성해 주세요.
2. **모듈 분리**: 핵심 로직은 `core/`에, 유틸리티 함수는 `util/`에 배치하여 `runner.luau`가 비대해지는 것을 방지합니다.
3. **testlib 철학 유지**: `checker`와 `validator` 관련 PR은 항상 `testlib.h`의 동작 방식과 일관성을 유지해야 합니다.

## 로컬 테스트
새로운 코드를 반영하기 전, 기존에 포함된 예제 문제(예: `examples/aplusb`)가 여전히 `AC`를 잘 출력하는지 회귀 테스트(Regression Test)를 반드시 진행해 주세요.

## PR (Pull Request) 제출
1. 이 저장소를 Fork 합니다.
2. 새로운 Branch를 생성합니다. (`git checkout -b feature/새기능`)
3. 코드를 커밋합니다. (`git commit -m "Add: 새로운 기능 추가"`)
4. Branch에 푸시합니다. (`git push origin feature/새기능`)
5. Pull Request를 엽니다.