# How to build PostgreSQL for the CI in-dyno installation

You will need credentials for the S3 bucket from the devex team.

```
export AWS_ACCESS_KEY_ID=<access key id from credentials>
export AWS_SECRET_ACCESS_KEY=<secret key from credentials>
export PGSQL_VERSION=9.6.9
docker build -t postgresql-builder .
docker run -e "S3_BUCKET=ci-database-binary" \
 -e "POSTGRESQL_VERSION=$PGSQL_VERSION" \
 -e "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" \
 -e "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" \
 -a=stdout -a=stderr postgresql-builder
```

This should create a docker image called `postgresql-builder` and then build
postgresql inside the image, and upload it to the S3 bucket.

# Building for heroku-16

Modify the `Dockerfile`

```
-FROM heroku/cedar:14
+FROM heroku/heroku:16
```

Modify the `postgresql-build` file.

```
-tar -zcf - . | /gof3r put -b $S3_BUCKET -k cedar-14/postgresql-$POSTGRESQL_VERSION.tgz
+tar -zcf - . | /gof3r put -b $S3_BUCKET -k heroku-16/postgresql-$POSTGRESQL_VERSION.tgz --acl public-read
```
