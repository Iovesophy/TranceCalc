%%
"tasu"             return ADD;
"hiku"             return SUB;
"kakeru"             return MUL;
"waru"             return DIV;
"\n"                return NL;

([1-9][0-9]*)|0|([0-9]+\.[0-9]*) {
double temp;
sscanf(yytext, "%lf", &temp);
yylval.double_value = temp;
return NUM;
};

[ \t] ;

. {
fprintf(stderr, "lexical error!!1!1!\n");
exit(1);
}

%%
