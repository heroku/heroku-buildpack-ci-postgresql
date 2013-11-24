Heroku buildpack: postgresql
=========================

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpacks) that
allows one to vendor in a postgresql binary to a Heroku application.
It is meant to be used in conjunction with other buildpacks as part of a
[multi-buildpack](https://github.com/ddollar/heroku-buildpack-multi).

To generate a postgresql binary for this buildpack, use
[heroku-pg-builder](https://github.com/deafbybeheading/heroku-pg-builder) to
generate the binary and insert the anvilworks url into the bin/compile script.
