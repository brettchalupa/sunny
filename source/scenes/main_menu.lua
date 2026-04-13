local gfx <const> = playdate.graphics
local md <const> = playdate.metadata

local function update()
  if playdate.buttonJustPressed(playdate.kButtonA) then
    SwitchScene(SCENE.GAMEPLAY)
  end

  if playdate.buttonJustPressed(playdate.kButtonB) then
    SwitchScene(SCENE.CREDITS)
  end

  gfx.clear()

  SetFont(Fonts.asheville24Light)
  gfx.drawText(md.name, 10, 10)

  SetFont(Fonts.default)
  gfx.drawText(md.author, 10, DISPLAY_HEIGHT - 24)
  gfx.drawText(md.version, DISPLAY_WIDTH - 62, DISPLAY_HEIGHT - 24)
end

local scene = {
  update = update,
}

return scene
