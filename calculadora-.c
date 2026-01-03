/*

Estático executável  Calculadora.c mas que vai buscar headers de funcao da calculadora para binários

*/
//header de  funcionalidades pertencentes ás mais comuns da biblioteca C
#include<stdio.h>
//header de funcionalidades pertencentes a "atof"
#include<stdlib.h>
//header de funcionalidade pertencente a matemática
#include<math.h>
//header de funcionalidade pertencente a strings
#include<string.h>
/*header de 
Funções calculadora: SOMA, SUBTRAÇÃO, Multiplicação, Divisão, Potência.
*/
/*
float soma(float p1, float p2)
{
	return p1 + p2;
}
float sub(float p1, float p2)
{
        return p1 - p2;
}
float mult(float p1, float p2)
{
        return p1 * p2;
}
float divi(float p1, float p2)
{
        return p1 / p2;
}
float pot(float p1, float p2)
{
	return (float) pow(p1, p2);
}
*/

/*
Código Executável
*/

//com argumentos na linha de comandos estas variáveis só são passadas à função main
/*
argc: quantidade de argumentos na linha de comando.
argv: vetor de strings com cada argumento
*/
int main(int argc, char** argv)
{
//imprimir texto no stdout
printf("Hello World!\n");

//ciclo de verificação argc inteiro tem de ser menor de 3 para passar apenas 2 parâmetros
/*
Se argc == 3 → trata funções unárias.
Se argc == 4 → trata operações binárias.
*/
 
if (argc != 3 && argc != 4) {
//%s é um placeholder para uma string e argv[0] na posiçao 0 é passado como argumento desta string
//Mensagem de informação para o utilizador de como deve executar o programa
	printf("Operadores binários: + - * ^ \n");
        printf("Funcoes unitarias de um so parametro: sqrt, sin, cos, tan\n");
	printf("Utilize:\n");
    	printf("  %s num1 oper num2    (para + - * ^)\n", argv[0]);
    	printf("  %s num1 oper         (para sqrt sin cos tan)\n", argv[0]);
	return 1;
 } 

/*
Variáveis Globais
*/
float param1, param2;

float res;


// ----- CASO UNÁRIO: argc == 3 -----
if (argc == 3) {
    // detectar se veio "oper num" ou "num oper"
    const char *op = NULL;
    const char *numstr = NULL;
    if ( (argv[1][0] >= 'A' && argv[1][0] <= 'Z') || (argv[1][0] >= 'a' && argv[1][0] <= 'z') ) {
        op = argv[1];
        numstr = argv[2];
    } else {
        numstr = argv[1];
        op = argv[2];
    }

    double a = atof(numstr);
    if (strcmp(op, "sqrt") == 0) {
        if (a < 0) { fprintf(stderr, "sqrt invalida para negativo.\n"); return 3; }
        double r = sqrt(a);
        printf("sqrt(%.6f) = %.10f\n", a, r);
        return 0;
    } else if (strcmp(op, "sin") == 0) {
        double r = sin(a);
        printf("sin(%.6f radianos) = %.10f\n", a, r);
        return 0;
    } else if (strcmp(op, "cos") == 0) {
        double r = cos(a);
        printf("cos(%.6f radianos) = %.10f\n", a, r);
        return 0;
    } else if (strcmp(op, "tan") == 0) {
        double r = tan(a);
        printf("tangente(%.6f radianos) = %.10f\n", a, r);
        return 0;
    } else {
        fprintf(stderr, "Funcao unitaria \"%s\" desconhecida.\n", op);
        return 4;
    }
}

//atof significa ASCII to Float. converte uma string texto para uma variáve>
//primeiro vetor de string (argv[1]) para ler os argumetos da linha de coma>
param1 = (float)atof(argv[1]);
//terceiro vetor de string (argv[3]) // // // //....
param2 = (float)atof(argv[3]);

//Verificação de vários fatores da calculadora:

switch (argv[2][0])
{
	case '+':
	res = soma(param1,param2);
	break;
	case '-':
        res = sub(param1,param2);
        break;
	case '*':
        res = mult(param1,param2);
        break;
	case '/':
        res = divi(param1,param2);
        break;
	case '^':
        res = pot(param1,param2);
        break;
	default:
	printf("Operacao %c nao definida.\n",argv[2][0]);

}
printf("Operacao: %f %c %f = %f",param1,argv[2][0],param2,res);
return 0;
}
