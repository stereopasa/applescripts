#!/bin/sh

SCRIPTS_PATH="$HOME/Library/Scripts/Folder Action Scripts"

mkdir -p "$SCRIPTS_PATH"
for FILE in ./scripts/*; do
  name="$(basename -s .applescript -- $FILE)"
  ext="${FILE##*.}"
  echo "name: $name, ext: $ext"
  osacompile -o "$SCRIPTS_PATH/$name.scpt" $FILE;
done

