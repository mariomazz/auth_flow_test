flutter build web --base-href="/" --release
rm -rf dist
mkdir -p dist/web
cp -r build/web dist
cp dist/web/index.html dist/web/404.html