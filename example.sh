#!/bin/bash

function escape_json_string() {
  local input=$1
  for ((i = 0; i < ${#input}; i++)); do
    local char="${input:i:1}"
    local escaped="${char}"
    case "${char}" in
      $'"' ) escaped="\\\"";;
      $'\\') escaped="\\\\";;
      *)
        if [[ "${char}" < $'\x20' ]]; then
          case "${char}" in 
            $'\b') escaped="\\b";;
            $'\f') escaped="\\f";;
            $'\n') escaped="\\n";;
            $'\r') escaped="\\r";;
            $'\t') escaped="\\t";;
            *) escaped=$(printf "\u%04X" "'${char}")
          esac
        fi;;
    esac
    echo -n "${escaped}"
  done
}

BUCKET_NAME=testbucket
OBJECT_NAME=testworkflow-2.0.1.jar
TARGET_LOCATION='/opt/My "Test"/testworkflow-2.0.1.jar'

JSON_STRING="{
\"bucketname\":\"$(escape_json_string "${BUCKET_NAME}")\",
\"objectname\":\"$(escape_json_string "${OBJECT_NAME}")\",
\"targetlocation\":\"$(escape_json_string "${TARGET_LOCATION}")\"
}"

echo "${JSON_STRING}"
