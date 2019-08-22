![Discord Logo](http://streamersquare.com/wp-content/uploads/2016/03/Discord-Community-Guide.png)

**Official Discord client in docker container (for X11 server with GUI)**
===

This repository has multi architecture support and is regularly updated.    
Container is built for amd64, arm and arm64.

Versions in the latest image
-----
- [Discord](https://discordapp.com/ "Discord Homepage") Version: 0.0.9
- [Debian Base Image](https://hub.docker.com/_/debian "Debian Docker Repo") Version: 9-slim

Start your container
-----
Use the below start sequence to get a running Discord client displaying on your host X11 server.    
Be aware, that this way of accessing the X11 server is not the safest, you will find more secure methods online.   
As the Discord client hast some strange startup behavior while updating, it needed a custom start-script, to work in docker.    

```
docker run -it \
      --memory 1gb \
      -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
      -e DISPLAY=$DISPLAY \ # to display on your host X11
      --device /dev/snd \ # to have sound output
      --device /dev/dri/card0 \ # to use graphics card acceleration (if needed)
      -v /dev/shm:/dev/shm \ 
      -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \ #might need a change to your system
     --name discord \
      avpnusr/discord:latest
```
   
If you close the discord window, you can restart the container any time with:     
```
docker start discord
```
