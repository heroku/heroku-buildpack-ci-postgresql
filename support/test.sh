#!/usr/bin/env bash

set -euo pipefail

[ $# -eq 1 ] || { echo "Usage: $0 STACK"; exit 1; }

STACK="${1}"

if [[ "${STACK}" == "cedar-14" ]]; then
    BASE_IMAGE="heroku/${STACK/-/:}"
else
    BASE_IMAGE="heroku/${STACK/-/:}-build"
fi

OUTPUT_IMAGE="postgresql-test-${STACK}"

echo "Building buildpack on stack ${STACK}..."

docker build \
    --build-arg "BASE_IMAGE=${BASE_IMAGE}" \
    --build-arg "STACK=${STACK}" \
    ${POSTGRESQL_VERSION:+--build-arg "POSTGRESQL_VERSION=${POSTGRESQL_VERSION}"} \
    -t "${OUTPUT_IMAGE}" \
    .

echo "Checking PostgreSQL server presence and version..."

TEST_COMMAND="for f in .profile.d/*; do source \"\$f\"; done && psql -tAc 'SHOW server_version;' \"\$DATABASE_URL\" | grep \"${POSTGRESQL_VERSION:-}\""
docker run --rm -it "${OUTPUT_IMAGE}" bash -c "${TEST_COMMAND}"

echo "Success!"
