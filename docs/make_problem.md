# 문제 세팅 가이드

## 디렉토리 생성

- 프로젝트 루트에 문제이름으로 된 폴더를 생성합니다. (예 : `problem_asdfasdf`)
```text
problem_name/
├── generated/
├── solutions/
├── Problem Setting.luau
├── generator.luau
├── validator.luau
└── checker.luau
```

## Problem Setting.luau 작성

문제의 스펙을 정의해야합니다. 템플릿은 다음과 같습니다.
```luau
return {
    timeLimit = 1.0,
    memoryLimit = 256,
    testcaseCount = 10,
    problemName = "문제 이름"
}
```

## 솔루션과 체커

- 1. `solutions/AC.luau`에 정답 코드를 작성합니다.
- 2. `checker.luau`를 작성해서, 출력 형식을 어떻게 검사할지 정의해야합니다.

## 데이터의 생성과 검증

- `generator.luau`를 작성하여 입/출력 데이터를 생성하는 로직을 구현합니다.
- `validator.luau`를 작성하여 생성된 데이터가 완벽한지 교차 검증하도록 합니다.
- `lune run problemname/generator`를 사용하여 제네레이터를 실행합시다.

## 실행

모든 준비가 끝났다면 Runner를 통해 정답 코드(AC.luau)가 무사히 모든 테스트케이스를 통과하는지 확인합니다.
```bash
lune run runner ./problem_name problem_name/solutions/AC.luau
```