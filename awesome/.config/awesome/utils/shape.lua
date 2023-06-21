local gears = require("gears")

local function rrect(r)
  return function(cr, w, h)
    return gears.shape.rounded_rect(cr, w, h, r)
  end
end

return {
  rrect = rrect,
}
