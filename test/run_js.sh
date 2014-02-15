#!/bin/bash

# This script is written for drone.io CI
dart2js -o test_client_js.dart.js test_client_js.dart

result=`content_shell --args --dump-render-tree test/test_client_js.ci.html 2>&1 | tee /dev/stdout | sed -n 2p | grep PASS`

if [ "$result" != "PASS" ]; then
  echo "Dart Client Test Failed"
  exit 1
else
  echo "Dart Client Test Passed"
  exit 0
fi
