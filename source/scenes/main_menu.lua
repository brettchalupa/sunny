local gfx <const> = playdate.graphics
local md <const> = playdate.metadata

local version = md.version
local VERSION_TEXT_WIDTH = Fonts.asheville14Bold:getTextWidth(version)
local ASHEVILLE14_HEIGHT = Fonts.asheville14Bold:getHeight()
local MARGIN = 10

local function update()
  if playdate.buttonJustPressed(playdate.kButtonA) then
    SwitchScene(SCENE.GAMEPLAY)
  end

  if playdate.buttonJustPressed(playdate.kButtonB) then
    SwitchScene(SCENE.CREDITS)
  end

  gfx.clear()

  SetFont(Fonts.asheville24Light)
  gfx.drawText(md.name, MARGIN, MARGIN)

  SetFont(Fonts.default)
  gfx.drawText(md.author, 10, DISPLAY_HEIGHT - ASHEVILLE14_HEIGHT - MARGIN)
  gfx.drawText(version, DISPLAY_WIDTH - VERSION_TEXT_WIDTH - MARGIN, DISPLAY_HEIGHT - ASHEVILLE14_HEIGHT - MARGIN)
end

local scene = {
  update = update,
}

return scene
