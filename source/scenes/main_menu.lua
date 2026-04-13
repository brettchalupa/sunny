local gfx <const> = playdate.graphics
local md <const> = playdate.metadata
local DISPLAY_HEIGHT <const> = playdate.display.getHeight()
local DISPLAY_WIDTH <const> = playdate.display.getWidth()

local function update()
  if playdate.buttonJustPressed(playdate.kButtonA) then
    SwitchScene(SCENE.GAMEPLAY)
  end

  if playdate.buttonJustPressed(playdate.kButtonB) then
    SwitchScene(SCENE.CREDITS)
  end

  gfx.clear()
  gfx.drawText(md.name, 10, 10)
  gfx.drawText(md.author, 10, DISPLAY_HEIGHT - 24)
  gfx.drawText(md.version, DISPLAY_WIDTH - 62, DISPLAY_HEIGHT - 24)
end

local scene = {
  update = update,
}

return scene
