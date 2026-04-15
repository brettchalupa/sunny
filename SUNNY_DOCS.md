# Sunny Documentation

What's provided by Sunny is intentionally minimal. Also, it's your code now. So
do with it whatever you want!

This document outlines how to get started with Sunny and how to extend what's
provided.

Start off by installing the dependencies and then running `just setup`.

## Development Commands

I most often use `just run` to test my code changes in the Simulator. It
compiles your game and opens it in the Simulator.

## Style Guide and Mindset

The style used throughout Sunny mostly follows playdate-luacats, which I'd
summarize as:

- Anything that's global (a.k.a. not `local`) starts with capital letters
- 2 spaces for indent, soft tabs
- Some constants are `SCREAMING_SNAKE_CASE`, like enums, numbers, etc. that
  aren't dynamic
- Uses enum-like tables to prevent having to pass strings around, as they're
  easy to mistype, like `OPTION.PLAY` instead of `"play"`
- Unused variables, like in function params, are prefixed an underscore (`_`)
- Capitalize acronyms, so `PlaySFX` instead of `PlaySfx`
- Sunny does not use object oriented programming (OOP) and instead opts for a
  simplistic approach centered around the data and functions

## FPS

Sunny targets 30 FPS by default. Change `FPS` in `source/main.lua` to run the
game at a different framerate.

## Sound Effects

There's a rudimentary synth for playing individual notes to use as sound
effects: `PlaySFX("A3")`. This is fine for getting started. But if you want to
play .wav files for sfx, load them up into a table and revise `PlaySFX` to use
that instead. See `source/sound.lua`.

## Scenes

Sunny comes with three scenes that nearly all games need: Main Menu, Credits,
and Gameplay. They're organized into `source/scenes`. They each return a table
of the scene's functions. A scene must have an `update` function in the table.
They can optionally have an `init` (called when scene is made active) and
`close` (called when the current scene is switched for another). `init` and
`close` are useful for loading and unloading data or reseting any kind of state.

`source/main.lua` contains a `local scenes` table that maps an enum to an
imported scene. This lets you switch scenes in any of your code with the global
`SwitchScene` function, like:

```lua
if playdate.buttonJustPressed(playdate.kButtonA) then
  SwitchScene(SCENE.GAMEPLAY)
end
```

You can add new scenes as needed based on what your game needs. You could mirror
this pattern to implement subscenes.

## Delta Time (dt)

Sunny supports `dt` (delta time between frames) so that games aren't framerate
dependent. This allows you to set the target refresh rate (FPS) to 50 or 30 and
the gameplay will be the same, just the smoothness will change (assuming your
game can run at a stable 50 FPS).

When `update` is called for a given scene, `dt` is passed into it. You can
choose to use it or not. See `source/gameplay.lua` for an example of how to use
it.

## Settings

Sunny comes with one setting out of the box: toggling the playing of sound
effects. The toggle for the value is in the Playdate menu. See
`source/settings.lua` for how settings work. Adding more settings based on
what's there is simple enough. These settings get saved when changed. The
`Settings` table is global for convenient access:

```lua
if Settings.playSFX then
  synth:playMIDINote(note, 0.5, 0.08)
end
```

## Save Data

Most games need save data, so Sunny includes this by default, with the ability
to save and load it. The Gameplay scene tracks play time. Save data is loaded on
game start and automatically saved before the game is closed. See
`source/save_data.lua` for details.

There's a global `SaveData` you can access to modify your data as needed.

You can save your save data by calling:

```lua
SaveSaveData()
```

And load it with:

```lua
LoadSaveData()
```

## Release

When it comes time to release your game, you can `just release` to push to itch.
Your `source/pdxinfo` file should have the `itch` line uncommented and set to
your username and game slug. This script will also create a zip for you in the
`builds` folder so you have them for posterity's sake.

The version that's set in itch.io gets pulled from `source/pdxinfo`.

If you want to release your game somewhere else, just revise `release.rb`
accordingly.
