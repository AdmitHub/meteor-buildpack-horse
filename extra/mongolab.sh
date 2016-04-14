#!/bin/sh
# Add an alias of MONGODB_URI to MONGO_URL.
echo "-----> Adding MONGODB_URI -> MONGO_URL env"
cat > "$APP_CHECKOUT_DIR"/.profile.d/mongolab.sh <<EOF
  #!/bin/sh
  # Set MONGO_URL to MONGODB_URI if it's not already set
  if [ -z \$MONGO_URL ] ; then
    export MONGO_URL=\$MONGODB_URI
  fi
EOF
