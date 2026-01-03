
# Compilador e flags
CC      = gcc
CFLAGS  = -Wall -Wextra -O2
LDFLAGS =
LDLIBS  = -lm

# Alvos
TARGET  = calculadora

# Alvo principal
all: $(TARGET)

# Pipeline explícito de etapas (se quiseres ver cada ficheiro intermédio)
$(TARGET): calculadora.o
	$(CC) $(LDFLAGS) $^ -o $@ $(LDLIBS)

# Gerar .i (pré-processado)
calculadora.i: calculadora.c
	$(CC) -E $< -o $@

# Gerar .s (assembly) a partir de .i
calculadora.s: calculadora.i
	$(CC) -S $< -o $@

# Gerar .o (objeto) a partir de .s
calculadora.o: calculadora.s
	$(CC) -c $< -o $@

.PHONY: all clean
clean:
	rm -f calculadora.i calculadora.s calculadora.o $(TARGET)
