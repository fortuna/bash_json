#! /bin/bash

source escape.sh

BUCKET_NAME=testbucket
OBJECT_NAME="C:\dir\testworkflow-2.0.1.jar"
TARGET_LOCATION='/opt/My "Test"/testworkflow-2.0.1.jar'

JSON_STRING="{
\"bucketname\":\"$(escape_json_string "${BUCKET_NAME}")\",
\"objectname\":\"$(escape_json_string "${OBJECT_NAME}")\",
\"targetlocation\":\"$(escape_json_string "${TARGET_LOCATION}")\"
}"

echo "${JSON_STRING}"

escape_json_string 'File: a\b\c
"my file"'