# Validator

`validator.luau`는 제네레이터가 생성한 혹은 수동으로 작성된 입력 데이터가 문제의 제약 조건을 (예: $1 \le N \le 10^5$)과 형식(공백, 줄바꿈)을 정확히 지키고 있는지 엄격하게 검사하는 스크립트입니다.

## Rule

- ** STRICT MODE ** : validator는 공백 하나, 줄바꿈 하나까지 완벽하게 일치해야 통과합니다.
- 입력 스트림은 `testlib.inf`를 사용합니다.

## Example

- 예제는 examples/aplusb/validator를 참고합니다.

## API

- inf:read_number(min, max, varable) : 주어진 범위의 정수를 읽어요.
- inf:read_space() : 정확히 한 칸의 공백을 검증합니다.
- inf:read_eoln() : 줄바꿈을 검증합니다.
- inf:read_eof() : 파일의 EOF를 검증합니다.