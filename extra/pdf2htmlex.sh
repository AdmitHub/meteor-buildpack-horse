#!/bin/sh

FONTFORGE_URL="https://s3.amazonaws.com/karmanotes-buildpack/fontforge-20120731-b-karmanotes-heroku.tar.gz"
POPPLER_URL="https://s3.amazonaws.com/karmanotes-buildpack/poppler-0.26.0-karmanotes-heroku.tar.gz"
PDF2HTMLEX_URL="https://s3.amazonaws.com/karmanotes-buildpack/pdf2htmlEX-karmanotes-heroku.tar.gz"

echo "-----> Installing pdf2htmlex."
for url in "$FONTFORGE_URL" "$POPPLER_URL" "$PDF2HTMLEX_URL" ; do
  # These are compiled and packaged to end up in /app/vendor/*/.
  curl -sS $url -o - | tar -zxf - -C $APP_CHECKOUT_DIR
done
# Add PATH and LD_LIBRARY_PATH for our things, which end up in /app/vendor/*/
# on the dyno.
mkdir -p "$APP_CHECKOUT_DIR"/.profile.d
cat > "$APP_CHECKOUT_DIR"/.profile.d/pdf2htmlex-paths.sh <<EOF
    #!/bin/sh
    export PATH="/app/vendor/pdf2htmlEX/bin:\$PATH"
    export LD_LIBRARY_PATH="\$LD_LIBRARY_PATH:/app/vendor/poppler/lib:/app/vendor/fontforge/lib"
EOF
