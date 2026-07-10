CC = gcc
FC = gfortran

CFLAGS = -Iinclude

OBJS = \
	   build/main.o \
	   build/bridge.o \
	   build/stats.o

app: $(OBJS)
	$(FC) $(OBJS) -o app

build/main.o: src/main.c
	mkdir -p build
	$(CC) $(CFLAGS) -c $< -o $@

build/bridge.o: src/bridge.c
	mkdir -p build
	$(CC) $(CFLAGS) -c $< -o $@

build/stats.o: src/stats.f90
	mkdir -p build
	$(FC) -c $< -o $@

clean: 
	rm -rf build app
