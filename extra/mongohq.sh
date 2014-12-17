#!/bin/sh
# Add an alias of MONGOHQ_URL to MONGO_URL.
echo "-----> Adding MONGOHQ_URL -> MONGO_URL env"
cat > "$APP_CHECKOUT_DIR"/.profile.d/mongohq.sh <<EOF
  #!/bin/sh
  # Set MONGO_URL to MONGOHQ_URL if it's not already set
  if [ -z \$MONGO_URL ] ; then
    export MONGO_URL=\$MONGOHQ_URL
  fi
EOF
