#!/bin/bash
docker run --platform=linux/amd64 -v $(pwd)/src:/usr/src -v node_modules:/usr/src/node_modules -w /usr/src --name debtest duquesnay/wdiobase:test-latest tail -f /dev/null &
sleep 1
docker exec debtest npm install
docker exec debtest npm run wdio-headless
# docker stop debtest
# docker remove debtest
