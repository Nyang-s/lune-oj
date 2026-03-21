local testlib = require("../../testlib")
return function(inp)
    testlib.registerValidation(inp)
    -- 1 이상 10^9 이하의 정수가 들어옴.
    testlib.inf:read_number(1, 10^9, "A")
    testlib.inf:read_space()
    testlib.inf:read_number(1, 10^9, "B")
    -- 입력처리
    testlib.inf:read_eoln()
    testlib.inf:read_eof()
    return true
end