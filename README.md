# Meteor Buildpack Horse

A heroku buildpack for Meteor v0.9.3+, using meteor's native packaging system
(sorry meteorite) and designed to be as simple and readable as possible.

## Extras

The basic buildpack should function correctly for any normal-ish meteor app,
with or without npm-container.  For extra steps needed for your particular build,
just add shell scripts to the "extras" folder and they will get sourced into the 
build.

Extras included in this branch:
 - ``mongohq-url.sh``: Set ``MONGO_URL`` to the value of ``MONGOHQ_URL``
 - ``phantomjs.sh``: Include phantomjs for use with ``spiderable``.

## Where things go

This buildpack creates a directory ``.meteor/heroku_build`` (``$COMPILE_DIR``)
inside the app checkout, and puts all the binaries and the built app in there.
So it ends up having the usual unixy ``bin/``, ``lib/``, ``share`` etc
subdirectories.  Those directories are added to ``$PATH`` and
``$LD_LIBRARY_PATH`` appropriately.

So ``$COMPILE_DIR/bin`` etc are great places to put any extra binaries or stuff
if you need to in custom extras.

## Why horse?

There are a gazillian forks and branches of various buildpacks remixing the
words "heroku", "buildpack", and "meteor", many of which are abandoned or
outdated or broken, and it's really hard to keep them straight.

So this one is the horse one.
