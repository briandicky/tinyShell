CC = gcc
override CFLAGS += -c -Wall -O3
LDFLAGS = 
LIBS =
SOURCES = tsh.c
DELE = .depend
OBJ = $(SOURCES:.c=.o)
EXE = tsh

all: $(SOURCES) $(EXE)

$(EXE): $(OBJ)
	$(CC) $(LDFLAGS) $(OBJ) -o $@ $(LIBS)

.c.o:
	$(CC) $(CFLAGS) $< -o $@

dep:
	$(CC) -M *.c > .depend

clean:
	rm -f $(OBJ) $(EXE) $(DELE)

DEBUG:
	@echo "Debugger mode, type this to compile your code:"
	@echo 'make clean CFLAGS+="-D __DEBUG__" all'

help:
	@echo "This is makefile command information:"
	@echo "==============================================="
	@echo "all = compile all the file."
	@echo "DEBUG = show the details of debugger mode."
	@echo "clean = remove executable and object file."
	@echo "dep = output the compiling detail to .depend file."
	@echo "==============================================="
	@echo 'Just use "make (FLAG)" then pass argument to make command.'
	@echo ""
