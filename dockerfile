FROM itzg/minecraft-server

# Basic configuration
ENV EULA=TRUE
ENV VERSION=1.18.2
ENV ONLINE_MODE=false

# Specific configuration for modpacks
ENV TYPE=FORGE
ENV CF_SERVER_MOD=https://mediafilez.forgecdn.net/files/5224/123/DawnCraft-Serverpack-2.0.14.zip
ENV FORGEVERSION=40.2.17  

# Performance settings (recommended memory for modpacks)
ENV MEMORY=6G

# Network settings
EXPOSE 25565

# Persistent volume for Minecraft data
VOLUME ["/data"]

# Copy the entrypoint script and the world_data folder into the container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Copy the world_data folder into the container (where your world will be stored)
COPY world_data /world_data

# Set the entrypoint to the custom script
ENTRYPOINT ["/entrypoint.sh"]

# Default command (Minecraft server start)
CMD ["/start"]
