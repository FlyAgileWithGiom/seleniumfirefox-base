#!/bin/bash
docker run --platform=linux/amd64 -v $(pwd)/src:/usr/src -v node_modules:/usr/src/node_modules -w /usr/src duquesnay/wdiobase:test-latest bash -c "npm install && npm run wdio-headless"
