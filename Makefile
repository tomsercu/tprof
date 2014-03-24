libprof.so: prof.c
	gcc -Wall -ansi -pedantic -O2 -shared -fPIC -o libprof.so prof.c
