# Generator

`generator.luau`는 문제의 `Problem Setting.luau`에 정의된 테스트 케이스의 횟수만큼 난수를 이용해 `.in` 파일과 `.out` 파일을 `generated/` 디렉토리에 생성합니다.

## Examples

- 예제는 examples/aplusb/generator를  참고합니다.
- 수동으로 만든 엣지 케이스(Edge case)를 삽입하려면, 이 스크립트 내에 특정 번호일 때 하드코딩된 문자열을 쓰도록 분기 처리하거나 별도의 handmadecase.luau를 활용하세요.