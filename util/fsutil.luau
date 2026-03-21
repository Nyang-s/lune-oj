local fs = require("@lune/fs")
local module = {}

function module.exist(path) return fs.isFile(path) end
function module.read(path) if fs.isFile(path) then return fs.readFile(path)  end;return nil end
function module.write(path,content)fs.writeFile(path,content)end
function module.ensure(dir)if not fs.isDir(dir)then fs.writeDir(dir)end end

return module