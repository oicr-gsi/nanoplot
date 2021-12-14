#!/bin/bash

find . -name "*.zip" | sort
find . -name "*.zip" -exec unzip {} -d nanoplot_test \; >/dev/null
cd nanoplot_test
find . \( -xtype f -size +0 -iname "*.png" -o -iname "*.html" \) -printf "non-zero file size: %f\n" | sort
find . -xtype f -iname "*.txt" -exec md5sum {} \; | sort
