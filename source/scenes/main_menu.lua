local gfx <const> = playdate.graphics

local function update()
  if playdate.buttonJustPressed(playdate.kButtonA) then
    SwitchScene(SCENE.GAMEPLAY)
  end

  if playdate.buttonJustPressed(playdate.kButtonB) then
    SwitchScene(SCENE.CREDITS)
  end

  gfx.clear()
  gfx.drawText("MAIN MENU", 10, 10)
end

local scene = {
  update = update,
}

return scene
