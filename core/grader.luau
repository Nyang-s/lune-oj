local process = require("@lune/process")
local fs = require("../util/fsutil")
local testlib = require("../testlib")
local module = {}

testlib.quit = function(verdict, msg)
    error(verdict .. "|" .. msg, 0)
end

function module.run_testcase(problem, solution, tc, set)
    local inp = string.format("%s/generated/%d.in", problem, tc)
    local ans = string.format("%s/generated/%d.out", problem, tc)
    local out = string.format("%s/generated/%d.user.out", problem, tc)
    if not fs.exist(inp) then 
        return nil
    end
    local start = os.clock()
    local ret = process.exec("lune", {"run", solution, inp})
    local endt = os.clock()
    local time_taken = endt - start
    if time_taken > set.timeLimit then
        return "TLE", time_taken, "Time Limit Exceeded"
    end
    if not ret.ok then
        return "RTE", time_taken, "Run Time Error\n" .. (ret.stderr or "")
    end
    fs.write(out, ret.stdout)
    local input_txt = fs.read(inp) or ""
    local output_txt = ret.stdout 
    local answer_txt = fs.read(ans) or ""
    local checker = require("../" .. problem .. "/checker")
    local success, err = pcall(checker, input_txt, output_txt, answer_txt)
    if success then
        return "IE", time_taken, "Internal Error: Checker가 판정을 내리지 않음"
    else
        local sep = err:find("|")
        if sep then
            local verdict = err:sub(1, sep - 1)
            local msg = err:sub(sep + 1)
            return verdict, time_taken, msg
        else
            return "IE", time_taken, "Checker Error: " .. tostring(err)
        end
    end
end

return module