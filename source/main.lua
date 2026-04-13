import("fonts")

local gfx <const> = playdate.graphics
local md <const> = playdate.metadata

-- gets set to `true` when the pdxinfo version has the `-dev` suffix
IS_DEBUG = string.find(playdate.metadata.version, "-dev") ~= nil
DISPLAY_HEIGHT = playdate.display.getHeight()
DISPLAY_WIDTH = playdate.display.getWidth()
FPS = 30 -- change this to whatever target framerate you want; Playdate max FPS is 50

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

-- Called once when the game starts
local function init()
  playdate.display.setRefreshRate(FPS)
end

---@diagnostic disable-next-line: duplicate-set-field
function playdate.update()
  -- Set default font to prevent lingering setting from last frame
  SetFont(Fonts.default)

  if pendingScene then
    currentScene = pendingScene
    pendingScene = nil
  end

  currentScene.update()

  if IS_DEBUG then
    playdate.drawFPS(DISPLAY_WIDTH - 18, 4)
  end
end

init()
