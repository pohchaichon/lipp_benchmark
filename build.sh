mkdir -p `dirname "$0"`/build
cd `dirname "$0"`/build
cmake3 -DCMAKE_BUILD_TYPE=Release .. && make
