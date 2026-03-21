local fs = require("@lune/fs")
local set = require("./Problem Setting")

-- generated가 없으면 generated를 생성해야함
if not fs.isDir("generated") then
    fs.writeDir("generated")
end

-- 시드를 설정한다.
math.randomseed(os.time())

-- 테스트 케이스 생성
for i = 1, set.testcaseCount do
    local a = math.random(1, 10^9)
    local b = math.random(1, 10^9)
    local inp = string.format("%d %d\n", a, b)
    local ans = string.format("%d\n", a + b)
    fs.writeFile(string.format("generated/%d.in", i), inp)
    fs.writeFile(string.format("generated/%d.out", i), ans)
    print(string.format("Testcase #%d generated.", i))
end