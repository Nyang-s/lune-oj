# 정답 코드 작성 가이드

`solutions/` 디렉토리에는 문제의 정답 코드(`AC.luau`)와, 오답 노트를 테스트하기 위한 다양한 코드(`WA.luau`, `TLE.luau` 등)를 보관해야합니다.


## I/O 처리

Lune OJ에서는, 파이프라인에 의한 OS 호환 문제를 피하기 위해, **입력 파일의 경로를 명령줄 인자(Arguments)로 전달받아 직접 읽는 방식**을 사용합니다.  출력은 평범하게 `print()`를 사용하면 채점기가 이를 캡처하여 검사합니다.

## 정답 코드 작성

- examples/aplusb/solutions/AC.luau를 참고합시다.