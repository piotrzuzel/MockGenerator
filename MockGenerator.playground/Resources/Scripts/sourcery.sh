#!/bin/sh

sourcesLocation=$1
templatesLocation=$2
tempLocation=`mktemp -d`
generatedFile="$tempLocation/AutoMockable.generated.swift"

cp -r $sourcesLocation $tempLocation
find $tempLocation -type f ! -name "*.*" -exec mv {} {}.swift \;

/usr/local/bin/sourcery --sources $tempLocation --templates $templatesLocation --output $tempLocation

open $generatedFile
