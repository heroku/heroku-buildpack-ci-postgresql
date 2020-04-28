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
[app.json](https://devcenter.heroku.com/articles/heroku-ci#setting-environment-variables-the-env-key)
to use a different major (e.g., "10" or "9.6") version. This feature
is experimental and subject to change.

## PostgreSQL fsync

If you want to turn off fsync during your test, you can set `HEROKU_CI_POSTGRES_FSYNC_OFF` in your [app.json env](https://devcenter.heroku.com/articles/heroku-ci#setting-environment-variables-the-env-key) section.

## Releasing a new version

Follow the [playbook](https://github.com/heroku/engineering-docs/blob/master/components/heroku-buildpack-ci-postgresql/update-version.md).
