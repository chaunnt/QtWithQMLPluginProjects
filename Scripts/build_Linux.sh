#!/bin/bash
for OUTPUT in "$@"
do
	cd "$OUTPUT"
	pwd
	make install
	cd ..
	pwd
done
