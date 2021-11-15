#!/usr/bin/make -f

CROSS_COMPILE = i686-w64-mingw32-
CC = $(CROSS_COMPILE)gcc
STRIP = $(CROSS_COMPILE)strip
CFLAGS = -O3 -march=i686
LDFLAGS =
DEPS = srvany-ng.c
OBJS = srvany-ng.o
EXEC_UNSTRIPPED = srvany-ng_unstripped.exe
EXEC = srvany-ng.exe

.PHONY: all
all: build

.PHONY: build
build: $(EXEC)

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS) $(LDFLAGS)

$(EXEC_UNSTRIPPED): $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS)

$(EXEC): $(EXEC_UNSTRIPPED)
	$(STRIP) -s $^ -o $@

.PHONY: clean
clean:
	rm -f $(OBJS) $(EXEC)
