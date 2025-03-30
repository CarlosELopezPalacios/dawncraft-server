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

# Call the original entrypoint to start the Minecraft server
exec /start
