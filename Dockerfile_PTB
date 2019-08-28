## Dockerfile for the PTB (Public Test Beta)

FROM debian:9-slim

MAINTAINER avpnusr

RUN 	apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y alsa-utils procps libatomic1 libgconf-2-4 libc++1 gconf2-common libc++abi1 libasound2 libnotify4 libnspr4 libnss3 libxss1 libxtst6 libappindicator1 libgtk-3-0 wget ca-certificates --no-install-recommends \
	&& wget -O /tmp/discord.deb "https://dl-ptb.discordapp.net/apps/linux/0.0.15/discord-ptb-0.0.15.deb" \
	&& dpkg -i /tmp/discord.deb \
	&& apt-get purge --auto-remove -y wget \
	&& apt-get clean && rm -rf /tmp/* && rm -rf /var/lib/apt/lists/* \
	&& useradd -r -m -u 1000 -G audio,video discord

## maybe you need to setup this alsa config for your needs ...
#COPY asound.conf /etc/asound.conf

COPY entrypoint.sh /home/discord/

USER discord

ENTRYPOINT [ "/bin/bash" ]
CMD [ "/home/discord/entrypoint.sh" ]
