#!/bin/bash

WORLD_NAME="${LEVEL:-"world"}"
MODS_DIR="/data/mods"
WORLD_DIR="/data/$WORLD_NAME"

if [ ! -d "$WORLD_DIR" ]; then
    echo "No world found, creating a new world..."

    if [ ! -d "$MODS_DIR" ]; then
        echo "No mods directory found, creating one..."
        mkdir -p "$MODS_DIR"
    fi

    if [ -z "$(ls -A $MODS_DIR)" ]; then
        echo "No mods found, downloading and installing modpack..."
        wget -q "$CF_SERVER_MOD" -O /data/modpack.zip
        unzip -q /data/modpack.zip -d /data
        rm /data/modpack.zip

        if [ -d "/data/mods" ]; then
            cp -r /data/mods/* $MODS_DIR/
        fi
    fi

    echo "Modpack installed. Sleeping for 30 seconds to allow proper mod loading and world generation..."
    sleep 30  # Wait for 30 seconds before starting the server

    echo "Starting Minecraft server with world: $WORLD_NAME"
    java -Xmx$MEMORY -jar /server.jar --level-name="$WORLD_NAME" --level-type="$LEVEL_TYPE" --seed="$SEED" --generate-structures="$GENERATE_STRUCTURES" --spawn-protection="$SPAWN_PROTECTION"
else
    echo "World '$WORLD_NAME' found, starting server..."
fi

chown -R minecraft:minecraft "$WORLD_DIR"
chmod -R 755 "$WORLD_DIR"

exec /start
