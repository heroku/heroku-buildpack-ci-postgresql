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
generally available on Heroku. You can specify a `POSTGRESQL_VERSION`
in the `env` section of your
[app.json](https://devcenter.heroku.com/articles/heroku-ci#environment-variables-env-key)
to use a different major (e.g., "10" or "9.6") version. This feature
is experimental and subject to change.

## Releasing a new version

Make sure you publish this buildpack in the buildpack registry

`heroku buildpacks:publish heroku/ci-postgresql master`
