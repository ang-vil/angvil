#!/bin/bash

./build.sh

rm angvil-ggj2022.zip

mkdir -p ggj-release/src
cp -r -- * ggj-release/src/

(
	cd ggj-release/ || exit

	mv src/dist/ release

	mkdir press
	cp src/assets/screenshots/screenshot_*.png press/

	zip -r ../angvil-ggj2022.zip .
)

rm -r ggj-release/
