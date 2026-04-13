local gfx <const> = playdate.graphics

FONT_ASHEVILLE_14 = playdate.graphics.font.new("/System/Fonts/Asheville-Sans-14-Bold.pft")
gfx.setFont(FONT_ASHEVILLE_14)

local scenes = {
  mainMenu = import("scenes/main_menu"),
  credits = import("scenes/credits"),
  gameplay = import("scenes/gameplay"),
}

local currentScene = scenes.mainMenu

---@diagnostic disable-next-line: duplicate-set-field
function playdate.update()
  currentScene.update()

  if playdate.buttonJustReleased(playdate.kButtonA) then
    currentScene = scenes.gameplay
  end

  if playdate.buttonJustReleased(playdate.kButtonB) then
    currentScene = scenes.credits
  end
end
