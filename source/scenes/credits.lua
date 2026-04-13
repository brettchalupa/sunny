local gfx <const> = playdate.graphics

local function update()
  if playdate.buttonJustPressed(playdate.kButtonB) then
    SwitchScene(SCENE.MAIN_MENU)
  end

  gfx.clear()
  gfx.drawText("CREDITS", 10, 10)
end

local scene = {
  update = update,
}

return scene
