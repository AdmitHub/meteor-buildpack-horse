# Meteor Buildpack Horse

A heroku buildpack for Meteor v0.9.3+ (including 1.0 and up), using meteor's
native packaging system (sorry meteorite) and designed to be as simple and
readable as possible.

To use this with your meteor app and heroku:

1. Set up your app to [deploy to heroku with git](https://devcenter.heroku.com/articles/git).
2. Set this repository as the buildpack URL:

        heroku config:set BUILDPACK_URL=https://github.com/nicolaslopezj/meteor-buildpack-horse.git

Once that's done, you can deploy your app using this build pack any time by pushing to heroku:

    git push heroku master

## Diference with original

This buildpack uses mongolab instead of mongohq