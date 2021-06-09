#!/usr/bin/env bash

set -e

# test data
FULL='
{
  "package": {
    "name": "COVAC_TRACKER_V1.1.3_DHIS2.35.3-en",
    "code": "COVAC",
    "type": "TRACKER",
    "version": "1.1.3",
    "lastUpdate": "20210408T081801",
    "DHIS2Version": "2.35.3",
    "DHIS2Build": "3492688",
    "locale": "en"
  }
}'
PACKAGE=$(echo "$FULL" | jq -r '.package')
FILE_NAME=$(echo "$PACKAGE" | jq -r '.name')

MAIN_DIR="complete"
OPTIONAL_DIR="dashboard"

function getUploadables {
  FILES=($(ls "$MAIN_DIR"))
  SOURCES=( "${FILES[@]/#/$MAIN_DIR/}" )

  if [ -d "dashboard" ]; then
    FILES=($(ls "$OPTIONAL_DIR"))
    SOURCES+=( "${FILES[@]/#/$OPTIONAL_DIR/}" )
  fi
}

function createJson {
  jq -n --arg key "$1" --arg value "$2" '[{"source": $key, "destination": $value}]'
}

function addToJson {
  echo "$1" | jq -c --argjson new "$2" '. += $new'
}

function createMatrix {
  matrix='[]'

  # create source -> destination for all files
  for file in "${SOURCES[@]}"
  do
    # if the extension is json it's a "package"
    if [ "${file#*.}" == "json" ]; then
      # if there is _ in the name, it's a translation
      if [[ "${file%%.*}" =~ "_" ]]; then
        filename="${file%%.*}"
        locale="${filename#*_}"
        # replace the default "en" locale
        addition=$(createJson "$file" "${FILE_NAME%-*}-$locale.${file#*.}")
      else
        addition=$(createJson "$file" "$FILE_NAME.${file#*.}")
      fi
      matrix=$(addToJson "$matrix" "$addition")
    fi

    # if the extension is html or xlsx it's a "reference"
    if [ "${file#*.}" == "html" ] || [ "${file#*.}" == "xlsx" ]; then
      addition=$(createJson "$file" "$FILE_NAME-ref.${file#*.}")
      matrix=$(addToJson "$matrix" "$addition")
    fi
  done
}

getUploadables

createMatrix

echo "$matrix"
