# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kbatz <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/07/04 18:46:50 by kbatz             #+#    #+#              #
#    Updated: 2019/07/04 19:05:29 by kbatz            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = sastantua
ORIGIN = sastantua_origin
NAME_TEST = a.sastantua.test
ORIGIN_TEST = b.sastantua.test

SRC =	main.c		\
		sastantua.c	\

all: test

compile:
	gcc -Wall -Wextra -Werror $(SRC) -o $(NAME)

test: compile 1 2 3 4 5 10 15 20 30 40 50

%:
	@echo 'BEGIN TEST '$@
	@echo 'ORIGIN:'
	time ./$(ORIGIN) $@ > $(ORIGIN_TEST)
	@echo ''
	@echo 'MY:'
	time ./$(NAME) $@ > $(NAME_TEST)
	diff $(NAME_TEST) $(ORIGIN_TEST)
	@echo 'END TEST '$@
	@echo ''

clean:
	rm -f $(NAME)
	rm -f $(NAME_TEST)
	rm -f $(ORIGIN_TEST)
