local gfx <const> = playdate.graphics

local player = {
  x = 10,
  y = 10,
  w = 16, -- width
  h = 16, -- height
  s = 4,  -- speed
}

local function update()
  if playdate.buttonIsPressed(playdate.kButtonLeft) then
    player.x -= player.s
  end
  if playdate.buttonIsPressed(playdate.kButtonRight) then
    player.x += player.s
  end
  if playdate.buttonIsPressed(playdate.kButtonUp) then
    player.y -= player.s
  end
  if playdate.buttonIsPressed(playdate.kButtonDown) then
    player.y += player.s
  end

  gfx.clear()
  gfx.fillRect(player.x, player.y, player.w, player.h)
end

local scene = {
  update = update,
}

return scene
