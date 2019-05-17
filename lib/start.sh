#!/bin/bash

export NODE_ENV=${NODE_ENV:-production}

# If the metrics url is not present, this is the wrong type of dyno, or the user has opted out,
# don't include the metrics plugin
if [[ -n "$HEROKU_METRICS_URL" ]] && [[ "${DYNO}" != run\.* ]] && [[ -z "$HEROKU_SKIP_NODE_PLUGIN" ]]; then

  # Don't clobber NODE_OPTIONS if the user has set it, just add the require flag to the end
  if [[ -z "$NODEJS_PARAMS" ]]; then
      export NODEJS_PARAMS="--require $HOME/.meteor/heroku_build/.heroku/heroku-nodejs-plugin"
  else
      export NODEJS_PARAMS="${NODEJS_PARAMS} --require $HOME/.meteor/heroku_build/.heroku/heroku-nodejs-plugin"
  fi

fi

.heroku/node/bin/node $NODEJS_PARAMS .meteor/heroku_build/app/main.js
