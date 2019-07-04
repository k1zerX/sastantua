# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kbatz <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/07/04 18:46:50 by kbatz             #+#    #+#              #
#    Updated: 2019/07/04 19:27:37 by kbatz            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = sastantua
ORIGIN = sastantua_origin
TEST = sastantua.test
NAME_TEST = a.$(TEST)
ORIGIN_TEST = b.$(TEST)

SRC =	main.c		\
		sastantua.c	\

all: compile test clean

compile:
	gcc -Wall -Wextra -Werror $(SRC) -o $(NAME)

compile_O:
	gcc -Wall -Wextra -Werror $(SRC) -o $(NAME) -O

compile_O2:
	gcc -Wall -Wextra -Werror $(SRC) -o $(NAME) -O2

compile_O3:
	gcc -Wall -Wextra -Werror $(SRC) -o $(NAME) -O3

compile_Os:
	gcc -Wall -Wextra -Werror $(SRC) -o $(NAME) -Os

test: 1test 2test 3test 4test 5test 10test 15test 20test 30test 40test 50test

%test:
	@echo 'BEGIN TEST '$@
	@echo 'ORIGIN:'
	time ./$(ORIGIN) $@ > $(ORIGIN_TEST)
	@echo ''
	@echo 'MY:'
	time ./$(NAME) $@ > $(NAME_TEST)
	diff $(NAME_TEST) $(ORIGIN_TEST) > $(TEST)
	cat $(TEST)
	@echo 'END TEST '$@
	@echo ''

clean:
	rm -f $(NAME)
	rm -f $(NAME_TEST)
	rm -f $(ORIGIN_TEST)
	rm -f $(TEST)
