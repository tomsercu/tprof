libprof.so: prof.c
	gcc -Wall -ansi -pedantic -O2 -shared -fPIC -o libprof.so prof.c

install: libprof.so
	ln -s /home/jure/torch7/prof-torch/libprof.so /home/jure/build/torch7/lib/lua/5.1/
