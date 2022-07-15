.POSIX:
.SUFFIXES:

include config.mk

SRC = $(NAME).c
OBJ = $(SRC:.c=.o) 
DEP = $(SRC:.c=.d)

all: $(NAME)

.PHONY: $(NAME)
-include $(DEP)
$(NAME): $(OBJ)
	$(CC) $(PCFLAGS) $(PLDFLAGS) $^ -o $@ 

.SUFFIXES: .c .o
.c.o:
	$(CC) -MMD $(PCFLAGS) -o $@ -c $<

.PHONY: clean
clean:
	rm -f $(OBJ)
	rm -f $(DEP)
	rm -f $(NAME)

