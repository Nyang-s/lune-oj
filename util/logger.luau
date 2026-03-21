local stdio = require("@lune/stdio")
local Logger = {}

function Logger.info(msg)
    stdio.write(stdio.color("cyan") .. msg .. stdio.color("reset") .. "\n")
end

function Logger.error(msg)
    stdio.write(stdio.color("red") .. stdio.style("bold") .. "ERROR: " .. msg .. stdio.style("reset") .. stdio.color("reset") .. "\n")
end

function Logger.header(problemName, solFile, tl, ml)
    stdio.write(stdio.color("purple") .. stdio.style("bold"))
    print(string.format("\n=== 채점 시작: %s ===", problemName))
    print(string.format("Solution: %s | TL: %.1fs | ML: %dMB", solFile, tl, ml))
    stdio.write(stdio.style("reset") .. stdio.color("reset") .. "\n")
end

function Logger.verdict(tc, verdict, timeTaken, msg)
    local color = "white"
    if verdict == "AC" then color = "green"
    elseif verdict == "WA" or verdict == "PE" then color = "red"
    elseif verdict == "TLE" or verdict == "RTE" then color = "yellow"
    elseif verdict == "IE" then color = "blue" end
    local tc_str = type(tc) == "number" and string.format("#%02d", tc) or tostring(tc)
    stdio.write(string.format("Testcase %s: ", tc_str))
    stdio.write(stdio.color(color) .. stdio.style("bold") .. string.format("%-4s", verdict) .. stdio.style("reset") .. stdio.color("reset"))
    stdio.write(string.format(" (%.3fs) %s\n", timeTaken, msg and "- " .. msg or ""))
end

return Logger