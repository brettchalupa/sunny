local gfx <const> = playdate.graphics
local md <const> = playdate.metadata

local function update()
  if playdate.buttonJustPressed(playdate.kButtonB) then
    SwitchScene(SCENE.MAIN_MENU)
  end

  gfx.clear()
  gfx.drawText("CREDITS", 10, 10)
  gfx.drawText("Made by " .. md.author, 10, 44)
end

local scene = {
  update = update,
}

return scene
