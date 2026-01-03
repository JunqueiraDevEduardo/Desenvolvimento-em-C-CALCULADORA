#Errado o .h está a ser compilado e não deveria corrigir depois!
# Alvos todos os TARGET 8
all: $(EXECS)


# Alvos principais
TARGET      := calculadora
EXECS       := $(TARGET)0 $(TARGET)1 $(TARGET)2 $(TARGET)3 $(TARGET)4 $(TARGET)5 $(TARGET)6 $(TARGET)7

# Fontes
MAIN_SRC    := calculadora-.c
HDRS        := calculadora+.h
LIBSRCS     := soma.c sub.c mult.c divi.c pot.c
LIBOBJS     := $(LIBSRCS:.c=.o)

# Bibliotecas (nome lógico e ficheiros)
LIB         := operacoes
LIBSTATIC   := lib$(LIB).a
LIBSHARED   := lib$(LIB).so

# Flags comuns
CC          := gcc
CFLAGS      := -Wall -Wextra -O2
LDFLAGS     :=
LDLIBS      := -lm

# Flags especiais
CFLAGS_DBG  := -Wall -Wextra -g -O0
CFLAGS_O3   := -Wall -Wextra -O3 -march=native
CFLAGS_ASAN := -Wall -Wextra -g -O1 -fsanitize=address -fno-omit-frame-pointer
LDFLAGS_ASAN:= -fsanitize=address

# Para shared library
CFLAGS_PIC  := -fPIC
LDFLAGS_SO  := -shared

# =====================
# Alvo "all" (8 alvos)
# =====================
.PHONY: all
all: $(EXECS)

# -------------------------------------------------------
# 0) build monolítico (compila e liga tudo num comando)
# -------------------------------------------------------
$(TARGET)0: $(MAIN_SRC) $(LIBSRCS) $(HDRS)
	$(CC) $(CFLAGS) $^ -o $@ $(LDLIBS)

# -------------------------------------------------------
# 1) objetos separados + link direto (sem biblioteca)
# -------------------------------------------------------
MAIN_OBJ := $(MAIN_SRC:.c=.o)

$(TARGET)1: $(MAIN_OBJ) $(LIBOBJS)
	$(CC) $(LDFLAGS) $^ -o $@ $(LDLIBS)

# Regra geral para .o (normal)
%.o: %.c $(HDRS)
	$(CC) $(CFLAGS) -c $< -o $@

# -------------------------------------------------------
# 2) link com biblioteca estática liboperacoes.a
# -------------------------------------------------------
$(TARGET)2: $(MAIN_OBJ) $(LIBSTATIC)
	$(CC) $(LDFLAGS) $(MAIN_OBJ) -L. -l$(LIB) -o $@ $(LDLIBS)

$(LIBSTATIC): $(LIBOBJS)
	ar rcs $@ $^

# -------------------------------------------------------
# 3) link com biblioteca partilhada liboperacoes.so
#     - usa RPATH para procurar a .so na pasta atual
# -------------------------------------------------------
$(TARGET)3: $(MAIN_OBJ) $(LIBSHARED)
	$(CC) $(LDFLAGS) -Wl,-rpath,'$$ORIGIN' $(MAIN_OBJ) -L. -l$(LIB) -o $@ $(LDLIBS)

# Objetos em PIC para a .so
%.pic.o: %.c $(HDRS)
	$(CC) $(CFLAGS) $(CFLAGS_PIC) -c $< -o $@

PICOBJS := $(LIBSRCS:.c=.pic.o)

$(LIBSHARED): $(PICOBJS)
	$(CC) $(LDFLAGS_SO) -o $@ $^

# -------------------------------------------------------
# 4) estático (lib .a) em modo Debug
# -------------------------------------------------------
$(TARGET)4: CFLAGS := $(CFLAGS_DBG)
$(TARGET)4: clean_objs $(MAIN_SRC) $(LIBSRCS) $(HDRS)
	$(CC) $(CFLAGS) -c $(MAIN_SRC) -o $(MAIN_OBJ)
	$(CC) $(CFLAGS) -c soma.c -o soma.o
	$(CC) $(CFLAGS) -c sub.c  -o sub.o
	$(CC) $(CFLAGS) -c mult.c -o mult.o
	$(CC) $(CFLAGS) -c divi.c -o divi.o
	$(CC) $(CFLAGS) -c pot.c  -o pot.o
	ar rcs $(LIBSTATIC) $(LIBOBJS)
	$(CC) $(LDFLAGS) $(MAIN_OBJ) -L. -l$(LIB) -o $@ $(LDLIBS)

# -------------------------------------------------------
# 5) partilhada (.so) em modo Debug
# -------------------------------------------------------
$(TARGET)5: CFLAGS := $(CFLAGS_DBG)
$(TARGET)5: clean_objs $(MAIN_SRC) $(LIBSRCS) $(HDRS)
	$(CC) $(CFLAGS) -c $(MAIN_SRC) -o $(MAIN_OBJ)
	$(CC) $(CFLAGS) $(CFLAGS_PIC) -c soma.c -o soma.pic.o
	$(CC) $(CFLAGS) $(CFLAGS_PIC) -c sub.c  -o sub.pic.o
	$(CC) $(CFLAGS) $(CFLAGS_PIC) -c mult.c -o mult.pic.o
	$(CC) $(CFLAGS) $(CFLAGS_PIC) -c divi.c -o divi.pic.o
	$(CC) $(CFLAGS) $(CFLAGS_PIC) -c pot.c  -o pot.pic.o
	$(CC) $(LDFLAGS_SO) -o $(LIBSHARED) soma.pic.o sub.pic.o mult.pic.o divi.pic.o pot.pic.o
	$(CC) $(LDFLAGS) -Wl,-rpath,'$$ORIGIN' $(MAIN_OBJ) -L. -l$(LIB) -o $@ $(LDLIBS)

# -------------------------------------------------------
# 6) Otimizado forte (-O3 -march=native) (link direto)
# -------------------------------------------------------
$(TARGET)6: CFLAGS := $(CFLAGS_O3)
$(TARGET)6: clean_objs $(MAIN_SRC) $(LIBSRCS) $(HDRS)
	$(CC) $(CFLAGS) $(MAIN_SRC) $(LIBSRCS) -o $@ $(LDLIBS)

# -------------------------------------------------------
# 7) AddressSanitizer (ótimo p/ procura de segfaults)
# -------------------------------------------------------
$(TARGET)7: CFLAGS := $(CFLAGS_ASAN)
$(TARGET)7: LDFLAGS := $(LDFLAGS_ASAN)
$(TARGET)7: clean_objs $(MAIN_SRC) $(LIBSRCS) $(HDRS)
	$(CC) $(CFLAGS) $(MAIN_SRC) $(LIBSRCS) -o $@ $(LDFLAGS) $(LDLIBS)

# Utilitários
.PHONY: clean clean_objs run0 run1 run2 run3
clean:
	rm -f *.o *.pic.o $(LIBSTATIC) $(LIBSHARED) $(EXECS)

# limpa apenas objetos (usado por alguns alvos)
clean_objs:
	rm -f *.o *.pic.o
