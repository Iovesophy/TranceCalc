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
%type <double_value> expression

%%

program		: statement
		| program statement
		;

statement	: expression NL
			{
			 fprintf(stdout, "%g\n", $1);
			}
		;

expression	: NUM
		| expression ADD NUM
			{
			 $$ = $1 + $3;
			}
		| expression SUB NUM
			{
			 $$ = $1 - $3;
			}
		| expression MUL NUM
			{
			 $$ = $1 * $3;
			}
		| expression DIV NUM
			{
			 $$ = $1 / $3;
			}
		;

%%

#include "lex.yy.c"

int
main()
{
	yyparse();
}
