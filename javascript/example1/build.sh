yo napi-module
npm install node-addon-api@latest
swig -javascript -napi -c++ -o src/example.cc example.i
node-gyp configure
node-gyp build
