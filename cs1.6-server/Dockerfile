FROM debian:9

ENV PORT 27015
ENV MAP de_dust2
ENV MAXPLAYERS 16
ENV SV_LAN 0

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -qqy install lib32gcc1 curl

WORKDIR /root
RUN mkdir Steam .steam

WORKDIR /root/Steam
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

RUN ./steamcmd.sh +login anonymous +force_install_dir /hlds +app_update 90 validate +quit || true
RUN ./steamcmd.sh +login anonymous +app_update 70 validate +quit || true
RUN ./steamcmd.sh +login anonymous +app_update 10 validate +quit || true
RUN ./steamcmd.sh +login anonymous +force_install_dir /hlds +app_update 90 validate +quit

WORKDIR /root/.steam
RUN ln -s ../Steam/linux32 sdk32

WORKDIR /hlds
ENTRYPOINT ./hlds_run -game cstrike -strictportbind -ip 0.0.0.0 -port $PORT +sv_lan $SV_LAN +map $MAP -maxplayers $MAXPLAYERS

COPY ./cstrike/maps/* /hlds/cstrike/maps/
COPY ./cstrike/models/* /hlds/cstrike/models/