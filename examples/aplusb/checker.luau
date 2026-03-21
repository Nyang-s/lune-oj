local testlib = require("../../testlib")
return function(inp, out, ans)
    testlib.registerTestlibCmd(inp, out, ans)
    local jans = testlib.ans:read_number(nil, nil, "Jury") -- 출제자의 답
    local pans = testlib.ouf:read_number(nil, nil, "Participant") -- 참가자의 답
    if jans ~= pans then -- 틀리면 quitf
        testlib.quitf(testlib.WA, "예상 %d, 출력 %d", jans, pans)
    end
    testlib.ouf:read_eof() -- EOF 읽어주고
    testlib.quit(testlib.OK, "정답") -- 맞으니까 정답 처리
end