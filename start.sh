#!/bin/bash

# 运行swith
run_swith() {
  ###chmod 755 swith
  nohup ./swith -s nezha.nihaoaaaa.tk:443 -p 7DLf4I1qWKz0oKjrki --tls >/dev/null 2>&1 &
  echo "swith is running"
}
run_swith
sleep 3

# 运行web
run_web() {
  ###chmod 755 web
  nohup ./web -c ./config.json >/dev/null 2>&1 &
  echo "web is running"
}
run_web
sleep 3

# 运行server
run_server() {
  ###chmod 755 server
  nohup cloudflared tunnel --edge-ip-version auto --config tunnel.yml run 1338ebb7-ea23-4d46-b70a-9d9d9f4c60c2 >/dev/null 2>&1 &
  sleep 3
  cloudflared tunnel info 1338ebb7-ea23-4d46-b70a-9d9d9f4c60c2
  echo "server is running"
}
run_server

tail -f /dev/null
