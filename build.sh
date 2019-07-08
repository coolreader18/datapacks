#!/bin/bash

set -e

cd "$(dirname "$0")"

mkdir -p dist

for f in *.mcf; do
  basename=${f%.mcf}
  output=dist/$basename
  datapack build "$f" --output "$output"
  zip=$(realpath "$output.zip")
  rm "$zip"
  (
    cd "$output"
    zip -q -r "$zip" .
  )
done
