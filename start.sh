#!/bin/bash

# 运行swith
run_swith() {
  ###chmod 755 swith
  nohup ./swith -s nezha.nihaoaaaa.tk:443 -p 7DLf4I1qWKz0oKjrki --tls >/dev/null 2>&1 &
  echo "swith is running"
}
run_swith
sleep 3


tail -f /dev/null
