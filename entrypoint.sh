#!/bin/bash

# Check if the world folder exists in the /data directory
if [ ! -d "/data/world" ]; then
    echo "No world found, copying 'New World' from /world_data..."

    # Copy the 'New World' directory to /data and rename it to 'world'
    cp -r /world_data/New\ World /data/world

    echo "'New World' copied successfully as 'world'."
else
    echo "World found, starting server..."
fi

# Fix the permissions on the world folder to allow Minecraft to write to it
chown -R minecraft:minecraft /data/world
chmod -R 755 /data/world

# Call the original entrypoint to start the Minecraft server
exec /start
