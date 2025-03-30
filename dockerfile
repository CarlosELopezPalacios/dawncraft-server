FROM itzg/minecraft-server

# Accept Minecraft EULA
ENV EULA=TRUE

# Specify the CurseForge server modpack ZIP URL
ENV CF_SERVER_MOD=https://mediafilez.forgecdn.net/files/5224/123/DawnCraft-Serverpack-2.0.14.zip

# Expose Minecraft server port
EXPOSE 25565

# Define volume for persistent data
VOLUME ["/data"]

# Set the entrypoint to the base image's startup script
CMD ["/start"]
