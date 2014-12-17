#!/bin/sh
# Add an alias of MONGOHQ_URL to MONGO_URL.
echo "-----> Adding MONGOLAB_URI -> MONGO_URL env"
cat > "$APP_CHECKOUT_DIR"/.profile.d/mongo.sh <<EOF
  #!/bin/sh
  export MONGO_URL=\${MONGO_URL:-\$MONGOLAB_URI}
EOF

