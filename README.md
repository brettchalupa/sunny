# Sunny ☀️ - Playdate Lua Template

Hit the ground running with this opionated game dev template for Playdate + Lua
made by Brett Chalupa (a.k.a. Brett Makes Games).

Currently targeted Playdate SDK version: 3.0.

Curious about Playdate game dev?
[Check out my book: _Make Games for Playdate with Lua_!](https://leanpub.com/playdatebook)

## Features / Bugs

- Simple and data driven
- Some globals, but not too many
- Essential scenes: main menu, gameplay, credits
- Save data with play time tracking - `SaveData` table
- Sound effect synth with setting toggle in Playdate menu - `PlaySFX("A4")`
- Lua language formatting and server protocol support
- `IS_DEBUG` boolean and versioning convention
- `just` commands
- itch.io release script: `just release`
- 2 space indentation, soft tabs
- Zed editor config
- Optimized for macOS (but works on other operating system)

## Template License

All of the code and assets in the Sunny template is released into the public
domain, unless otherwise noted. Pick your own license for your game once you
make it.

Asheville font by Panic, licensed for use under the
[Creative Commons Attribution 4.0 International (CC BY 4.0) license](https://creativecommons.org/licenses/by/4.0/).

## Use the Template

Delete everything above, update `YOURGAME` accordingly throughout the source,
and make a great game.

---

# YOURGAME

## Developing

### Prerequisites

- [Playdate SDK](https://play.date/dev/)
- [git](https://git-scm.com/)
- [just](https://just.systems/)
- Ruby
- [itch.io butler](https://itch.io/docs/butler/) - if you want to release on
  itch.io

On macOS and Linux you can install all prerequisites via
[Homebrew](https://brew.sh/) by running:

```
brew bundle
```

### Setup

After cloning, initialize the vendored submodules by running:

```
just setup
```

### Reference

- [Playdate SDK docs](https://sdk.play.date)
- [Designing for Playdate](https://help.play.date/developer/designing-for-playdate/) -
  best practices guide
