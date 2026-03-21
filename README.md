# Lune OJ
![screenshot](logo.png)

Lune OJ는 오직 **[Luau](https://luau-lang.org/)**와 **[Lune](https://lune-org.github.io/docs)** 환경만으로 구동되는 빠르고 가벼운 알고리즘 채점(Online Judge) 시스템입니다.  
경쟁 프로그래밍(CP)의 표준인 `testlib.h`의 철학을 Luau로 완벽히 이식하여, 무거운 백엔드 서버나 복잡한 의존성 없이 로컬 환경에서 즉시 문제를 세팅하고 채점할 수 있습니다.

## Features
- **순수 Lune 기반**: Node.js나 Python 등 외부 런타임 없이 `lune` 실행 파일 하나로 동작합니다.
- **Testlib.luau 내장**: `validator`(엄격한 입력 검증)와 `checker`(유연한 정답 비교)를 지원하여 CP 표준에 맞는 문제 출제가 가능합니다.
- **완벽한 모듈화**: 채점기(Grader), 로거(Logger), 파일 시스템 유틸리티(FS Util)가 분리되어 있어 유지보수와 확장이 매우 쉽습니다.
- **크로스 플랫폼**: Windows, macOS, Linux 환경 어디서든 경로 충돌 없이 안정적으로 채점(`AC`, `WA`, `TLE`, `RTE`)을 수행합니다.

## 설치와 준비
- 1. Lune을 설치해줍시다. `rokit`등을 사용하여 설치합시다.
- 2. 이 저장소를 클론 합니다.
- 3. VSC를 사용한다면, 자동완성을 위해 `lune setup` 명령어를 설정해주세요.

## 빠른 시작

내장된 A+B 문제를 통해 채점을 테스트할 수 있습니다.

1. 솔루션 채점
`runner.luau`를 사용하여, 유저의 코드를 채점합니다.
```bash
lune run runner ./examples/aplusb examples/aplusb/solutions/ac.luau
```

2. 콘솔에서 시간 제한과 실행 시간, 최종적인 판정을 확인할 수 있습니다.

## 문서

문제 세팅과 API등은 `docs/` 폴더를 참고합시다.