local fs = require("@lune/fs")
local process = require("@lune/process")
-- 입력 파일의 경로를 받는다.
local input_file = process.args[1]
if not input_file then
    return 
end
-- 데이터를 읽고, 
local input_data = fs.readFile(input_file)
-- 정규 표현식을 사용해서, input_data를 파싱해서 로직을 처리한다.
local a_str, b_str = string.match(input_data, "(%d+)%s+(%d+)")
if a_str and b_str then
    local a = assert(tonumber(a_str), "A is not a number")
    local b = assert(tonumber(b_str), "B is not a number")
    -- 결과 출력.
    print(a + b)
end