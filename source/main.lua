local gfx <const> = playdate.graphics

FONT_ASHEVILLE_14 = playdate.graphics.font.new("/System/Fonts/Asheville-Sans-14-Bold.pft")
gfx.setFont(FONT_ASHEVILLE_14)

local MARGIN <const> = 10

---@diagnostic disable-next-line: duplicate-set-field
function playdate.update()
  gfx.drawText("Hello, Sunny!", MARGIN, MARGIN)
end
