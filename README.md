# Meteor Buildpack Horse

A heroku buildpack for Meteor v0.9.3+ (including 1.0 and up), using meteor's
native packaging system and designed to be as simple and readable as possible.

*NOTE: previous versious of this buildpack used Compose (aka MongoHQ) which no longer offers a free tier to heroku users. If you still need MongoHQ, use the [MongoHQ branch](https://github.com/AdmitHub/meteor-buildpack-horse/tree/mongohq).*

To use this with your meteor app and heroku:

1. Set up your app to [deploy to heroku with git](https://devcenter.heroku.com/articles/git).
2. Set this repository as the buildpack URL:

        heroku config:set BUILDPACK_URL=https://github.com/AdmitHub/meteor-buildpack-horse.git

3. Add the MongoLab addon:
        
        heroku addons:add mongolab

4. If it isn't set already, be sure to set the ``ROOT_URL`` for meteor (replace URL with whatever is appropriate):

        heroku config:set ROOT_URL=https://<yourapp>.herokuapp.com

Once that's done, you can deploy your app using this build pack any time by pushing to heroku:

    git push heroku master

## Extras

The basic buildpack should function correctly for any normal-ish meteor app,
with or without npm-container.  For extra steps needed for your particular build,
just add shell scripts to the "extras" folder and they will get sourced into the 
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

Meteor is under active developement, recent changes in its core broke support for 
certain meteor packages designed to access their own assets at first run. The issue
has been reported on https://github.com/meteor/meteor/issues/2606, but it may take 
a while to have it fixed. In the meanwhile you can circumvent the problem by setting 
the following variable in your Heroku Config Vars:
   
    BUILDPACK_PRELAUNCH_METEOR

## Why horse?

There are a gazillian forks and branches of various buildpacks remixing the
words "heroku", "buildpack", and "meteor", many of which are abandoned or
outdated or broken, and it's really hard to keep them straight.

So this one is the horse one.
