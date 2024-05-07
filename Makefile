##
## EPITECH PROJECT, 2023
## Untitled (Workspace)
## File description:
## Makefile
##

NAME		= 42sh

SRCS		= src/main.c
SRCS		+= src/utiles/get_line.c
SRCS		+= src/utiles/my_putstr_fd.c
SRCS		+= src/utiles/my_getenv.c
SRCS		+= src/utiles/tab_addline.c
SRCS		+= src/utiles/my_tabdup.c
SRCS		+= src/utiles/print_dash_help.c
SRCS		+= src/utiles/tab_del_line.c
SRCS		+= src/utiles/init_struct.c
SRCS		+= src/utiles/is_piped.c
SRCS	    += src/utiles/get_last_line_tab.c
SRCS	    += src/utiles/handle_error.c
SRCS		+= src/command_handler/my_exit.c
SRCS		+= src/command_handler.c
SRCS		+= src/minishell.c
SRCS		+= src/command_handler/my_cd.c
SRCS		+= src/command_handler/my_env.c
SRCS		+= src/command_handler/my_setenv.c
SRCS		+= src/command_handler/my_unsetenv.c
SRCS	    += src/command_handler/check_path.c
SRCS        += src/handle_pipe/handle_pipe.c
SRCS        += src/handle_redirection/handle_redirection.c


OBJS     = $(SRCS:.c=.o)

CFLAGS   = -Wall -Wextra -I include -I lib/include -g

	GREEN=\033[1;32m
	YELLOW=\033[1;93m
	GREY=\033[2;49m
	ITALIC=\033[3m
	NC=\033[0m

all: $(NAME)

$(NAME): build_lib $(OBJS)
		@ gcc -o $(NAME) $(OBJS) -L./lib -lmy

build_lib:
	make -C ./lib

clean:
	make fclean -C ./lib
	$(RM) $(OBJS)
	find . -name "#*#" -delete -o -name "*~" -delete
	$(RM) coding-style-reports.log
	$(RM) vgcore*

fclean: clean
	$(RM) a.out
	$(RM) lib/libmy.a
	$(RM) $(NAME)

re: fclean all

debug: fclean
debug: CFLAGS += -g
debug: all

tests_run: all
	make -C tests

.c.o:
	@ $(CC) -o $(subst .c,.o,$<) -c $< $(CFLAGS) \
		&& echo -e "[ ${GREEN}OK${NC} ] ${GREY}$<${NC}" \
		|| echo -e "[ ${YELLOW}KO${NC} ] ${ITALIC}$<${NC}"

.PHONY: re fclean clean all .c.o
