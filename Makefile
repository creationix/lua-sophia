CFLAGS=-pthread -fPIC -I/home/tim/Code/luvi/deps/luv/luajit/src -Isophia/db
LIBS=-shared

all: sophia.so

sophia.so: lua-sophia.c $(shell find sophia/db -type f)
	$(CC) lua-sophia.c -o sophia.so ${CFLAGS} ${LIBS}

clean:
	rm -f sophia.so
