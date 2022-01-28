#!/usr/bin/env bash

set -e

rm -rf dist/
mkdir -p dist

echo 'Building for web ...'
godot --export "HTML5" dist/index.html
echo 'done.'

echo 'Building for linux ...'
godot --export 'Linux/X11' dist/angvil.x86_64
chmod a+x dist/angvil.x86_64
echo 'done.'

echo 'Building for Windows ...'
godot --export 'Windows Desktop' dist/angvil.exe
echo 'done.'

echo 'done.'
