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
