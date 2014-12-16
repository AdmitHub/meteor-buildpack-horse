#!/bin/sh

echo "-----> Installing node inspector."

npm install -g node-inspector
node-inspector &
export NODE_OPTIONS='--debug-brk'