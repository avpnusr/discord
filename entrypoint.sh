#! /bin/bash

# sorry for this piece of junk ...
# as discord needs several restarts on initial startup, for updating 
# it kills the container and would need manual restarting for the update to finish
# this script automates this behaviour and makes it easy to use

STATFILE="/home/discord/dinit"

if [ -f "$STATFILE" ]; then
	echo "Normal startup..."
	discord
	exit 0
else
	echo "First start, using special startup method" 
	touch $STATFILE
	discord 
	while true; do
		sleep 3
		RUN=$(ps -ef | grep -i discord | wc -l)
		if [ "$RUN" == "5" ]; then
			exit 0
		fi	
	done
fi
