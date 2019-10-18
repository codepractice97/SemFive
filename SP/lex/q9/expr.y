%{
#include <stdio.h>
extern int yylex();
void yyerror(const char *s);
%}

%token DIGIT NEWLINE IDEN
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%
line: expr NEWLINE { printf("Valid Expression\n"); return 0; }
		;
expr: expr '+' expr
		| expr '-' expr
		| expr '*' expr
		| expr '/' expr
		| expr '%' expr
		| '(' expr ')'
		| DIGIT
		| IDEN
		;
%%

void main(){
	printf("\nEnter an aritmetic expression: ");
	yyparse();
}

void yyerror(const char *s){
	printf("Invalid Expression: %s\n", s);
}
