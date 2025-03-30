FROM itzg/minecraft-server

ENV EULA=TRUE
ENV VERSION=1.18.2
ENV ONLINE_MODE=false
ENV TYPE=FORGE
ENV CF_SERVER_MOD=https://mediafilez.forgecdn.net/files/5224/123/DawnCraft-Serverpack-2.0.14.zip
ENV FORGEVERSION=40.2.17
ENV LEVEL="New World"
ENV LEVEL_TYPE=DEFAULT
ENV SEED=
ENV GENERATE_STRUCTURES=true
ENV SPAWN_PROTECTION=0
ENV MEMORY=6G

EXPOSE 25565

VOLUME ["/data"]

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY world_data /world_data

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/start"]
