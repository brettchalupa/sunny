local gfx <const> = playdate.graphics

local function update()
  gfx.clear()
  gfx.drawText("CREDITS", 10, 10)
end

local scene = {
  update = update,
}

return scene
