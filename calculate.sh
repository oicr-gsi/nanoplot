#!/bin/bash

find . -name "*.zip" -exec unzip {} \; >/dev/null
find . -type f -not -path "./*.zip" -not -name "*.log" -exec md5sum {} + 