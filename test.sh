#!/bin/bash
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
rm -rf bin &> /dev/null;
mkdir bin &> /dev/null;

g++ test.cpp crc32.cpp crc16.cpp sha1.c sha1.cpp -I./ -o bin/test -m64 -pedantic -std=c++11 -Wall -Wextra -Wlong-long -Wunused -pipe -march=native -mtune=native -O0 -g3 -ggdb -pg;
g++ hash.cpp crc32.cpp crc16.cpp sha1.c sha1.cpp -I./ -o bin/hash -m64 -pedantic -std=c++11 -Wall -Wextra -Wlong-long -Wunused -pipe -march=native -mtune=native -O0 -g3 -ggdb -pg;

./bin/test;

exit "${?}";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
