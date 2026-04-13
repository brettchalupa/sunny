local gfx <const> = playdate.graphics

FONT_ASHEVILLE_14 = playdate.graphics.font.new("/System/Fonts/Asheville-Sans-14-Bold.pft")
gfx.setFont(FONT_ASHEVILLE_14)

SCENE = {
  MAIN_MENU = "mainMenu",
  CREDITS = "credits",
  GAMEPLAY = "gameplay",
}

local scenes = {
  [SCENE.MAIN_MENU] = import("scenes/main_menu"),
  [SCENE.CREDITS] = import("scenes/credits"),
  [SCENE.GAMEPLAY] = import("scenes/gameplay"),
}

local currentScene = scenes[SCENE.MAIN_MENU]

local pendingScene = nil

-- Switch the active scene to the specified key from `SCENE`
function SwitchScene(key)
  pendingScene = scenes[key]
end

---@diagnostic disable-next-line: duplicate-set-field
function playdate.update()
  if pendingScene then
    currentScene = pendingScene
    pendingScene = nil
  end

  currentScene.update()
end
