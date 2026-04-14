local gfx <const> = playdate.graphics
local md <const> = playdate.metadata

local function update(_dt)
  if playdate.buttonJustPressed(playdate.kButtonB) then
    PlaySFX("B3")
    SwitchScene(SCENE.MAIN_MENU)
  end

  gfx.clear()

  SetFont(Fonts.asheville24Light)
  gfx.drawText("CREDITS", 10, 10)

  SetFont(Fonts.default)
  gfx.drawText("Made by " .. md.author, 10, 50)
end

local scene = {
  update = update,
}

return scene
