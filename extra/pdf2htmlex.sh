#!/bin/sh

FONTFORGE_URL="https://s3.amazonaws.com/karmanotes-buildpack/fontforge-20120731-b-karmanotes-heroku.tar.gz"
POPPLER_URL="https://s3.amazonaws.com/karmanotes-buildpack/poppler-0.26.0-karmanotes-heroku.tar.gz"
PDF2HTMLEX_URL="https://s3.amazonaws.com/karmanotes-buildpack/pdf2htmlEX-karmanotes-heroku.tar.gz"

echo "-----> Installing pdf2htmlex."
for url in "$FONTFORGE_URL" "$POPPLER_URL" "$PDF2HTMLEX_URL" ; do
  curl -sS $url -o - | tar -zxf - -C $COMPILE_DIR --strip 2
done
# Add an alias to set "data-dir" for pdf2htmlEX every time we call it, since
# our pre-compiled binary puts the default data-dir somewhere random.
mkdir -p "$APP_CHECKOUT_DIR"/.profile.d
cat > "$APP_CHECKOUT_DIR"/.profile.d/pdf2htmlex-alias.sh <<EOF
    alias pdf2htmlEX="pdf2htmlEX --data-dir \$HOME/$COMPILE_DIR_SUFFIX/share/pdf2htmlEX" 
EOF
