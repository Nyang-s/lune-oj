local fs = require("@lune/fs")
local process = require("@lune/process")

local testlib = {}
testlib.OK = "AC"
testlib.WA = "WA"
testlib.PE = "PE"
testlib.FAIL = "FAIL"
testlib.DIRT = "DIRT"

function quit(verdict, msg)
    print(string.format("[%s] %s", verdict, msg))
    process.exit(verdict == testlib.OK and 0 or 1)
end

testlib.quit = quit
function testlib.quitf(ver, fmt, ...)
    quit(ver, string.format(fmt, ...))
end

local InStream = {}
InStream.__index = InStream

function InStream.new(content, name,  is_strict)
    local self = setmetatable({}, InStream)
    self.content = content
    self.pos = 1
    self.len = #content
    self.name = name
    self.strict  = is_strict or false
    return self
end

function InStream.from_file(path, name, is_strict)
    local content = ""
    if fs.isFile(path) then
        content = fs.readFile(path)
    else 
        testlib.quitf(testlib.FAIL, "Instream이 파일을 찾을 수 없어요.. : %s", path)
    end
    return InStream.new(content, name, is_strict)
end

function InStream.from_string(content, name, is_strict)
    return InStream.new(content, name, is_strict)
end

function InStream:is_eof()
    return self.pos > self.len
end

function InStream:skip_whitespace()
    while not self:is_eof() do
        local c = self.content:sub(self.pos, self.pos)
        if c == " " or c == "\n" or c == "\r" or c == "\t" then
            self.pos = self.pos + 1
        else
            break
        end
    end
end

function InStream:read_word(regex_str)
    if not self.strict then
        self:skip_whitespace()
    end
    if self:is_eof() then
        testlib.quitf(testlib.FAIL, "예상치 못한 EOF가 발생했어요. (%s)", self.name)
    end
    local start_pos = self.pos
    while not self:is_eof() do
        local ch = self.content:sub(self.pos, self.pos)
        if ch == " " or ch == "\n" or ch == "\r" or ch == "\t" then
            break
        end
        self.pos = self.pos + 1
    end
    local word = self.content:sub(start_pos, self.pos - 1)
    if regex_str and not string.match(word, "^" .. regex_str .. "$") then
        testlib.quitf(testlib.FAIL, "토큰 '%s'가 정규식과 일치하지 않아요.", word)
    end
    return word
end

function InStream:read_number(mn, mx, var)
    local word = self:read_word()
    local val = tonumber(word)

    if not val or math.floor(val) ~= val then
        testlib.quitf(testlib.FAIL, "'수'가 필요해요.. 발견된 토큰 : '%s'", word)
    end
    if mn and val < mn then
        testlib.quitf(testlib.FAIL, "변수 '%s'의 값이 너무 작아요..", var or "?")
    end
    if mx and val > mx then
        testlib.quitf(testlib.FAIL, "변수 '%s'의 값이 너무 커요..", var or "?")
    end
    return val
end

function InStream:read_space()
    if self:is_eof() or self.content:sub(self.pos, self.pos) ~= " " then
        testlib.quitf(testlib.FAIL, "공백이 필요해요..")
    end
    self.pos = self.pos + 1
end

function InStream:read_eoln()
    if self:is_eof() then
         testlib.quitf(testlib.FAIL, "줄바꿈이 필요해요..")
    end
    local c = self.content:sub(self.pos, self.pos)
    if c == "\r" then
        self.pos = self.pos + 1
        if self.content:sub(self.pos, self.pos) == "\n" then
            self.pos = self.pos + 1
        else
            testlib.quitf(testlib.FAIL, "\\r 뒤에 \\n이 필요해요..")
        end
    elseif c == "\n" then
        self.pos = self.pos + 1
    else
        testlib.quitf(testlib.FAIL, "줄바꿈(EOLN)을 기대했는데, 다른 문자열이 나왔어요.. ")
    end
end

function InStream:read_eof()
    if not self.strict then
        self:skip_whitespace()
    end
    if not self:is_eof() then
        testlib.quitf(testlib.FAIL, "스트림의 끝에 도달하지 않았아요..")
    end
end

testlib.InStream = InStream

function testlib.registerValidation(input)
    testlib.inf = InStream.from_string(input, "input", true)
end

function testlib.registerTestlibCmd(input, output, answer)
    testlib.inf = InStream.from_string(input, "input", false)
    testlib.ouf = InStream.from_string(output, "output", false)
    testlib.ans = InStream.from_string(answer, "answer", false)
end

return testlib