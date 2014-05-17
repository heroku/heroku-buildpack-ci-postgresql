## Compiling new versions of postgresql using Docker

Install [docker](https://www.docker.io/). For OSX, I recommend using
[dvm](http://fnichol.github.io/dvm/) to get virtualbox, vagrant and boot2docker
set up correctly.

Build:

```
$ cd support
$ docker build -t your-username/postgresql-builder .
$ docker run -i -v /home/docker/cache:/var/cache \
  -e POSTGRESQL_VERSION=<postgresql-version> \
  -e AWS_ACCESS_KEY_ID=<ur-key> \
  -e AWS_SECRET_ACCESS_KEY=<ur-secret-key> \
  -e S3_BUCKET="gregburek-buildpack-postgresql" \
  your-username/postgresql-builder
```

## Publishing buildpack updates

```
heroku plugins:install https://github.com/heroku/heroku-buildpacks

cd heroku-buildpack-postgresql
git checkout master
heroku buildpacks:publish gregburek/postgresql
```
