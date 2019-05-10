#!/bin/sh

sourcesLocation=$1
templatesLocation=$2
outputLocation=$3

/usr/local/bin/sourcery --sources $sourcesLocation --templates $templatesLocation --output $outputLocation

open "$outputLocation/AutoMockable.generated.swift"
