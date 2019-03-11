# How to build PostgreSQL for the CI in-dyno installation

You will need credentials for the S3 bucket (ci-database-binary in ops-bundles account).

```
AWS_ACCESS_KEY_ID=<access key id from credentials>
AWS_SECRET_ACCESS_KEY=<secret key from credentials>
PGSQL_VERSION=11.2
./build-postgresql "$PGSQL_VERSION" "$AWS_ACCESS_KEY_ID" "$AWS_SECRET_ACCESS_KEY"
```

This will create a docker image called `postgresql-builder` and then build postgresql inside the image, and upload it to the S3 bucket. It will do this for all the stacks in `build-postgresql`.
