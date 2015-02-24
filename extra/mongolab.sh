#!/bin/sh
# Add an alias of MONGOLAB_URI to MONGO_URL.
echo "-----> Adding MONGOLAB_URI -> MONGO_URL env"
cat > "$APP_CHECKOUT_DIR"/.profile.d/mongolab.sh <<EOF
  #!/bin/sh
  # Set MONGO_URL to MONGOLAB_URI if it's not already set
  if [ -z \$MONGO_URL ] ; then
    export MONGO_URL=\$MONGOLAB_URI
  fi
EOF
