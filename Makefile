LDFLAGS=-lobjc -framework Foundation
CFLAGS=-fobjc-arc -g

main: main.o Person.o

Person.o: Person.m Person.h

clean:
	rm -rf *.o main main.dSYM

.PHONY: clean
