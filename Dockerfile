ARG BASE_IMAGE
FROM $BASE_IMAGE
USER root

ARG STACK
ARG POSTGRESQL_VERSION

# initdb and pg_ctl error if run as root.
RUN useradd -m -d /app non-root-user
RUN mkdir -p /app /cache /env
RUN chown non-root-user /app /cache /env
USER non-root-user

RUN [ -z "${POSTGRESQL_VERSION}" ] || echo "${POSTGRESQL_VERSION}" > /env/POSTGRESQL_VERSION
COPY --chown=non-root-user . /buildpack
WORKDIR /app

# Sanitize the environment seen by the buildpack, to prevent reliance on
# environment variables that won't be present when it's run by Heroku CI.
RUN env -i PATH=$PATH HOME=$HOME STACK=$STACK /buildpack/bin/detect /app
RUN env -i PATH=$PATH HOME=$HOME STACK=$STACK /buildpack/bin/compile /app /cache /env
