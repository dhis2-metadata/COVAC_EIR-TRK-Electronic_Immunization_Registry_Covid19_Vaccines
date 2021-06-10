#!/usr/bin/env bash

set -e

declare -a SOURCES
declare -r MAIN_DIR="complete"
declare -r OPTIONAL_DIR="dashboard"

# TODO
# construct destination
# have correct locale subdirs

function getUploadables {
  FILES=($(ls "$MAIN_DIR"))
  SOURCES=( "${FILES[@]/#/$MAIN_DIR/}" )

  if [ -d "$OPTIONAL_DIR" ]; then
    OPTIONAL_FILES=($(ls "$OPTIONAL_DIR"))
    SOURCES+=( "${OPTIONAL_FILES[@]/#/$OPTIONAL_DIR/}" )
  fi
}

# if the extension is json it's a "package"
function isPackage {
  [[ "${1#*.}" == "json" ]]
}

# if the extension is html or xlsx it's a "reference"
function isReference {
  [[ "${1#*.}" == "html" ]] || [[ "${1#*.}" == "xlsx" ]]
}

# get JSON object "package"
function getPackageVersion {
  if isPackage "$1"; then
    jq -r '.package' < "$1"
  fi
}

# create source->destination JSON
function createJson {
  jq -n --arg key "$1" --arg value "$2" '[{"source": $key, "destination": $value}]'
}

# append $2 to $1
function addToJson {
  echo "$1" | jq -c --argjson new "$2" '. += $new'
}

function createDestination {
  # incomplete
  DESTINATION=''
  if [[ $1 =~ $OPTIONAL_DIR  ]]; then
    DESTINATION+="$OPTIONAL_DIR/"
  fi
}

function createMatrix {
  matrix='[]'

  # create source -> destination for all files
  files=("$@")
  for file in "${files[@]}"
  do
    createDestination "$file"
    packageVersion=$(getPackageVersion "$file")
    echo "$packageVersion"

    # default filename for references?
    FILE_NAME=$(echo "$packageVersion" | jq -r '.name')

    if isPackage "$file"; then
      # TODO Remove this! if there is _ in the name, it's a translation
      if [[ "${file%%.*}" =~ "_" ]]; then
        filename="${file%%.*}"
        locale="${filename#*_}"
        # replace the default "en" locale
        addition=$(createJson "$file" "$DESTINATION${FILE_NAME%-*}-$locale.${file#*.}")
      else
        addition=$(createJson "$file" "$DESTINATION$FILE_NAME.${file#*.}")
      fi
      matrix=$(addToJson "$matrix" "$addition")
    fi

    if isReference "$file"; then
      addition=$(createJson "$file" "$DESTINATION$FILE_NAME-ref.${file#*.}")
      matrix=$(addToJson "$matrix" "$addition")
    fi
  done
}

getUploadables

createMatrix "${SOURCES[@]}"

echo "$matrix"
