#!/bin/bash

Xvfb :1 -screen 0 1366x768x24 &
export DISPLAY=:1

x11vnc -display :1 -forever -nopw -listen 0.0.0.0 &

google-chrome \
  --no-sandbox \
  --disable-dev-shm-usage \
  --disable-gpu &

websockify --web=/usr/share/novnc 6080 localhost:5900
