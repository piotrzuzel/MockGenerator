#!/bin/sh

sourcesLocation=$1
templatesLocation=$2
outputLocation=$3

echo $sourcesLocation
echo $templatesLocation
echo $outputLocation

/usr/local/bin/sourcery --sources $sourcesLocation --templates $templatesLocation --output $outputLocation

open "$outputLocation/AutoMockable.generated.swift"
