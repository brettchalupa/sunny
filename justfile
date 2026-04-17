bin := "YOURGAME.pdx"

# Open finder selector
default:
    @just --choose

# Initializes the git submodule for luacats
setup:
    git submodule update --init --recursive

# Build the game with the Playdate compiler (pdc)
build:
    pdc source {{ bin }}

# Build and run the game by opening it in the Playdate Simulator
run: build
    #!/usr/bin/env sh
    if [ "$(uname)" == "Darwin" ]; then
        open {{ bin }}
    else
        $PLAYDATE_SDK_PATH/bin/PlaydateSimulator {{ bin }}
    fi

# Remove the pdx from disk
clean:
    rm -rf {{ bin }}

# Run the release script, pushing to itch.io
release:
    ruby release.rb
