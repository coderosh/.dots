local lgi = require("lgi")
local NM = lgi.NM

local nm = {}

function nm:get_status()
  return {}
end

nm._client = NM.Client.new()

return nm
