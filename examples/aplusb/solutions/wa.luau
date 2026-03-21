local fs = require("@lune/fs")
local process = require("@lune/process")
local input_file = process.args[1] 
if not input_file then
    return 
end
local input_data = fs.readFile(input_file)
local a_str, b_str = string.match(input_data, "(%d+)%s+(%d+)")
if a_str and b_str then
    local a = assert(tonumber(a_str), "A is not a number")
    local b = assert(tonumber(b_str), "B is not a number")
    print(a + b + 1)
end