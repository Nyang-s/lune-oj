local process = require("@lune/process")
local logger = require("./util/logger")
local fs_util = require("./util/fsutil")
local grader = require("./core/grader")

local args = process.args
if #args < 2 then
    logger.error("사용법: lune run runner <문제 디렉토리> <솔루션 파일>")
    process.exit(1)
end

local problemDir = args[1]
local solutionFile = args[2]

if not fs_util.exist(solutionFile) then
    logger.error("솔루션 파일을 찾을 수 없습니다: " .. solutionFile)
    process.exit(1)
end
if not fs_util.exist(problemDir .. "/Problem Setting.luau") then
    logger.error("문제 설정 파일을 찾을 수 없습니다.")
    process.exit(1)
end

local settings = require(problemDir .. "/Problem Setting")
logger.header(settings.problemName, solutionFile, settings.timeLimit, settings.memoryLimit)
local allAC = true
local maxTime = 0

for i = 1, settings.testcaseCount do
    local verdict, timeTaken, msg = grader.run_testcase(problemDir, solutionFile, i, settings)
    
    if not verdict then
        logger.info(string.format("테스트케이스 %d개가 채점되었습니다.", i - 1))
        break
    end

    maxTime = math.max(maxTime, timeTaken)
    logger.verdict(i, verdict, timeTaken, msg)

    if verdict ~= "AC" then
        allAC = false
        break
    end
end


print("\n-----------------------------------------")
if allAC then
    logger.verdict("All", "AC", maxTime, "AC!")
else
    logger.error("채점 실패. 코드를 다시 확인해 주세요.")
end