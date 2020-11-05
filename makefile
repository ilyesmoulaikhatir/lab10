CC = gcc
OBJ = max.o min.o var.o

ifeq ($(DEBUG),yes)
     CC_OPTIONS = -g -Wall
else
     CC_OPTIONS =
endif

install: my-binaire
	mv $< $(HOME)

my-binaire: test.c max.c min.c var.c
	@if [ $(DEBUG) = yes ]; then\
        	echo "la compilation se déroule en mode DEBUG";\
	else\
		echo "la compilation se déroule en mode RELEASE";\
	fi
	$(CC) $(CC_OPTIONS) $^ -o $@

%.o: %.c
	$(CC) $(CC_OPTIONS) -c $^ -o $@

clean: 
	rm -rf $(OBJ) my-binaire
