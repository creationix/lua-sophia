CFLAGS=-I../luvi/deps/luv/luajit/src -Isophia/db
ifeq ($(shell uname -s),Darwin)
LIBS=-bundle -undefined dynamic_lookup
CFLAGS+= -fno-common
else
LIBS=-shared
CFLAGS+= -pthread -fPIC
endif

all: sophia.so

sophia.so: lua-sophia.c $(shell find sophia/db -type f)
	$(CC) lua-sophia.c -o sophia.so ${CFLAGS} ${LIBS}

clean:
	rm -f sophia.so
