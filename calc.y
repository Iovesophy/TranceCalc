%{
#include <stdio.h>

static void
yyerror(const char *s)
{
	fputs(s, stderr);
	fputs("\n", stderr);
}

static int
yywrap(void)
{
	return 1;
}

%}

%union {
	double double_value;
}

%token <double_value> NUM
%token ADD SUB MUL DIV NL
%type <double_value> expression term primary_expression

%%

program		: statement
		| program statement
		;

statement	: expression NL
			{
			 fprintf(stdout, "---->   計算結果    <----\n%g\n", $1);
			 fprintf(stdout, "---->  電卓継続!!!  <----\n");
			}
		;

expression	: term
		| expression ADD term
			{
			 $$ = $1 + $3;
			}
		| expression SUB term
			{
			 $$ = $1 - $3;
			}
		;
term		: primary_expression
		| term MUL primary_expression
			{
			 $$ = $1 * $3;
			}
		| term DIV primary_expression
			{
			 $$ = $1 / $3;
			}
		;
primary_expression : NUM
		;

%%

#include "lex.yy.c"

int
main()
{
	yyparse();
}
