FROM itzg/minecraft-server

# Accept Minecraft EULA
ENV EULA=TRUE

# Set the server version to the latest vanilla version (you can specify the latest version or use the default latest)
ENV VERSION=latest

# Set the Minecraft server to offline mode for non-premium users
ENV ONLINE_MODE=false

# Expose Minecraft server port
EXPOSE 25565

# Define volume for persistent data
VOLUME ["/data"]

# Copy the server.properties file into the container (if you have a custom one)
COPY server.properties /data/server.properties

# Start the Minecraft server
CMD ["/start"]
