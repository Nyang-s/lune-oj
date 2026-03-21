# Checker

`checker.luau`는 유저가 제출한 코드의 출력과 출제자의 정답을 비교하여, 채점 결과를 판독합니다.

## Rule
- **Lenient Mode**: 유저의 출력 데이터에 있는 불필요한 연속 공백이나 후행 줄바꿈은 너그럽게 무시하고 '값' 자체를 검증합니다.
- 정답 파일은 `testlib.ans`, 유저 출력 파일은 `testlib.ouf`, 입력 파일은 `testlib.inf` 스트림을 사용합니다.

## Example

- 예제는 examples/aplusb/checker를  참고합니다.