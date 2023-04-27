#!/bin/sh
pandoc --from markdown --template eisvogel --listings -F pandoc-plantuml  "$@"
