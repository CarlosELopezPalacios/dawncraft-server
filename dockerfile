FROM itzg/minecraft-server

# Accept Minecraft EULA
ENV EULA=TRUE

# Set the server version
ENV VERSION=1.18.2

# Set the Minecraft server to offline mode for non-premium users
ENV ONLINE_MODE=false

# Specify the CurseForge server modpack ZIP URL for DawnCraft
ENV CF_SERVER_MOD=https://mediafilez.forgecdn.net/files/5224/123/DawnCraft-Serverpack-2.0.14.zip

# Expose Minecraft server port
EXPOSE 25565

# Define volume for persistent data
VOLUME ["/data"]

# Set the entrypoint to the base image's startup script
CMD ["/start"]
