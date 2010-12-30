#!/bin/bash

if [ ! -f ./site.sh ]; then
    echo "this script should only be run from root of the project"
    exit 1
fi

source util/cdn_stuff.sh
source util/jekyll.sh

$*