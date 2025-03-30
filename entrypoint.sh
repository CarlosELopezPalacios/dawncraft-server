#!/bin/bash

WORLD_NAME="${LEVEL:-"New World"}"

if [ ! -d "/data/$WORLD_NAME" ]; then
    java -Xmx$MEMORY -jar /server.jar --level-name="$WORLD_NAME" --level-type="$LEVEL_TYPE" --seed="$SEED" --generate-structures="$GENERATE_STRUCTURES" --spawn-protection="$SPAWN_PROTECTION"
else
    echo "World '$WORLD_NAME' found, starting server..."
fi

chown -R minecraft:minecraft "/data/$WORLD_NAME"
chmod -R 755 "/data/$WORLD_NAME"

exec /start
