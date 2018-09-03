NAME = libfts

AS = nasm
ASFLAGS = -f macho64
ASDIR = asm
ASSRCDIR = $(ASDIR)/src
ASOBJDIR = $(ASDIR)/obj
ASSRCFILES = $(addprefix $(ASSRCFILES)/, $(addsuffix .s, $(FUNNAMES)))
ASOBJFILES = $(addprefix $(ASOBJDIR)/, $(addsuffix .o, $(FUNNAMES)))

CC = clang
CFLAGS = -Wall -Wextra -Werror
TESTDIR = tests
TESTSRCDIR = $(TESTDIR)/src
TESTOBJDIR = $(TESTDIR)/obj
TESTSRCFILES = $(addprefix $(TESTSRCFILES)/, $(addsuffix .test.c, $(FUNNAMES)))
TESTOBJFILES = $(addprefix $(TESTOBJDIR)/, $(addsuffix .test.o, $(FUNNAMES)))
TESTEXECFILES = $(addprefix $(TESTDIR)/, $(addsuffix .test, $(FUNNAMES)))

.PRECIOUS: $(TESTOBJDIR)/%.test.o

FUNNAMES = ft_bzero \
		   ft_cat \
		   ft_isalnum \
		   ft_isalpha \
		   ft_isascii \
		   ft_isdigit \
		   ft_isprint \
		   ft_memcpy \
		   ft_memset \
		   ft_puts \
		   ft_strcat \
		   ft_strdup \
		   ft_strlen \
		   ft_tolower \
		   ft_toupper

$(ASOBJDIR)/%.o : $(ASSRCDIR)/%.s
	$(AS) $(ASFLAGS) -o $@ $<

$(TESTOBJDIR)/%.test.o : $(TESTSRCDIR)/%.test.c
	$(CC) $(CFLAGS) -o $@ -c $<

$(TESTDIR)/%.test : $(TESTOBJDIR)/%.test.o $(ASOBJDIR)/%.o
	$(CC) -o $@ $^

$(NAME): FORCE $(ASOBJFILES)
	ar rcs $(NAME) $(ASOBJFILES)

all: $(NAME)

obj: $(ASOBJFILES)

lib: all

clean:
	rm -f $(ASOBJFILES)

fclean: clean
	rm -f $(NAME)

re: fclean all

tests: FORCE $(TESTEXECFILES)

runtests: tests
	$(TESTEXECFILES)

testclean:
	rm -f $(TESTOBJFILES)

testfclean: testclean
	rm -f $(TESTEXECFILES)

bleach: fclean testfclean

FORCE:
	mkdir -p $(ASSRCDIR) $(ASOBJDIR) $(TESTSRCDIR) $(TESTOBJDIR)
