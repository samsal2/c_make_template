VERSION = 0.0.1


NAME = c_make_template

INC = 
LIB = 
WARN =  -Wall -Wextra -Wshadow -pedantic -pedantic-errors
SANITIZE = -fsanitize=address -fsanitize=undefined -fsanitize=bounds

PCFLAGS = $(INC) $(WARN) $(CFLAGS)
PLDFLAGS = $(LIB) $(SANITIZE) $(LDFLAGS)

