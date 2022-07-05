.POSIX:
.SUFFIXES:

NAME = c_make_template

WARNFLAGS = -Wall -Wextra -Wshadow -pedantic -pedantic-errors
SANITIZEFLAGS = -fsanitize=address -fsanitize=undefined -fsanitize=bounds

PCFLAGS = $(WARNFLAGS) $(SANITIZEFLAGS) $(CFLAGS)
PLDFLAGS = $(SANITIZEFLAGS) $(LDFLAGS)

SRC = main.c
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

