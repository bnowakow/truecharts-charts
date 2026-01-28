#!/bin/bash -x

while true; do

	git commit -am "update"; 
	git push; 
	./update.sh
	date;
	sleep 1h;
done

