#! /bin/bash

set -eu
set -o pipefail

source ./env.sh

PATHS=(output/txt2img data/config data/embeddings data/models)
for DIR in "${PATHS[@]}"
do
    if [ -d ${DIR} ]; then
        s4cmd sync ${DIR} s3://${S3_BUCKET}/${DIR} --endpoint-url ${S3_ENDPOINT} --access-key ${S3_ACCESS_KEY} --secret-key ${S3_SECRET_KEY}
    fi
done