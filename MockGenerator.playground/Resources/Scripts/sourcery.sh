#!/bin/sh

sourcesLocation=$1
templatesLocation=$2
outputLocation=`mktemp -d`
generatedFile="$outputLocation/AutoMockable.generated.swift"

/usr/local/bin/sourcery --sources $sourcesLocation --templates $templatesLocation --output $outputLocation

open $generatedFile
