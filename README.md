**Warning** this is an experimental buildpack and is provided as-is without any
promise of support.

# Heroku CI buildpack: Postgresql

This experimental [Heroku buildpack](http://devcenter.heroku.com/articles/buildpacks)
vendors Postgresql into the dyno. It is intended for use with Heroku CI or any
other environment where data retention is not important.

Please note that Postgresql will lose all data each time a dyno restarts.

## Usage

This is intended to be transparent to your application. Connect to the database
in the same way as you would for [Heroku Postgresql](https://www.heroku.com/postgres)
by reading the value of the `DATABASE_URL` environment variable into your application.

By default, the buildpack provides the latest Postgres version that is
[generally available on Heroku](https://devcenter.heroku.com/articles/heroku-postgresql#version-support). You can specify `POSTGRESQL_VERSION` to use a different major (e.g., "10" or "9.6") version.
Set it in the `env` section of [app.json](https://devcenter.heroku.com/articles/heroku-ci#setting-environment-variables-the-env-key) or as a [config var](https://devcenter.heroku.com/articles/config-vars). This feature is experimental and subject to change.

## Releasing a new version

Follow the [playbook](https://github.com/heroku/engineering-docs/blob/master/components/heroku-buildpack-ci-postgresql/update-version.md).
