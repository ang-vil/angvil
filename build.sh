#!/usr/bin/env bash

set -e

rm -rf dist/
mkdir -p dist

echo 'Building for web ...'
godot --no-window --export "HTML5" dist/index.html
echo 'done.'

echo 'Building for linux ...'
godot --no-window --export 'Linux/X11' dist/angvil.x86_64
chmod a+x dist/angvil.x86_64
echo 'done.'

echo 'Building for Windows ...'
godot --no-window --export 'Windows Desktop' dist/angvil.exe
echo 'done.'

echo 'Building for Switch ...'
godot-switch-v3.3.4-linux/godot_server.x11.opt.tools.64 --export 'Switch' dist/angvil.nro
echo 'done.'

echo 'done.'
