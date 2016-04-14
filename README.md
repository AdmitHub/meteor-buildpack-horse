# Meteor Buildpack Horse

[![Horse](https://i.imgur.com/YhIL9zM.jpg)](https://commons.wikimedia.org/wiki/File:Draw-Costa_Rican-2smallest.jpg)

A heroku buildpack for Meteor v1+, designed to be as simple and readable as possible.

To use this with your meteor app and heroku:

1. Set up your app to [deploy to heroku with git](https://devcenter.heroku.com/articles/git).
2. Set this repository as the buildpack URL:

        heroku buildpacks:set https://github.com/AdmitHub/meteor-buildpack-horse.git

3. Add the MongoLab addon:
        
        heroku addons:create mongolab

4. If it isn't set already, be sure to set the ``ROOT_URL`` for meteor (replace URL with whatever is appropriate):

        heroku config:set ROOT_URL=https://<yourapp>.herokuapp.com

Once that's done, you can deploy your app using this build pack any time by pushing to heroku:

    git push heroku master

## Extras

The basic buildpack should function correctly for any normal-ish meteor app,
with or without npm-container.  For extra steps needed for your particular build,
just add shell scripts to the `extra` folder and they will get sourced into the 
build.

Extras included in this branch:
 - ``mongolab.sh``: Set ``MONGO_URL`` to the value of ``MONGOLAB_URI``.
 - ``phantomjs.sh``: Include phantomjs for use with ``spiderable``.

## Where things go

This buildpack creates a directory ``.meteor/heroku_build`` (``$COMPILE_DIR``)
inside the app checkout, and puts all the binaries and the built app in there.
So it ends up having the usual unixy ``bin/``, ``lib/``, ``share`` etc
subdirectories.  Those directories are added to ``$PATH`` and
``$LD_LIBRARY_PATH`` appropriately.

So ``$COMPILE_DIR/bin`` etc are great places to put any extra binaries or stuff
if you need to in custom extras.

## Workarounds 

If your app depends on packages which must have access to their own assets at 
first run, this can break building.  The current best known workaround is to
launch the meteor app *before* runing `meteor --build`, so that the usual runtime compiling
makes these assets available.  If your app needs this, set `BUILDPACK_PRELAUNCH_METEOR=1`
in the Heroku Config Vars for your app.  [Reference issue](https://github.com/meteor/meteor/issues/2606).

## Why horse?

Therea re a gazillian forks and branches of various buildpacks remixing the
words "heroku", "buildpack", and "meteor", many of which are abandoned or
outdated or broken, and it's really hard to keep them straight.

So this one is the horse one.

README image credit: wikicommons contributor [Arsdelicata](https://commons.wikimedia.org/wiki/User:Arsdelicata)
