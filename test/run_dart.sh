#!/bin/bash

# This script is written for drone.io CI

result=`content_shell --args --dump-render-tree test/test_client_dart.html 2>&1 | tee /dev/stdout | sed -n 2p | grep PASS`

if [ "$result" != "PASS" ]; then
  echo "Dart Client Test Failed"
  exit 1
else
  echo "Dart Client Test Passed"
  exit 0
fi
