%{
#include <stdio.h>
extern int yylex();
void yyerror(const char *s);
%}

%token DIGIT NEWLINE
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%
line: expr NEWLINE { printf("Result is: %d\n", $1); return 0; }
		;
expr: expr '+' expr { $$=$1+$3; }
		| expr '-' expr { $$=$1-$3; }
		| expr '*' expr { $$=$1*$3; }
		| expr '/' expr { $$=$1/$3; }
		| expr '%' expr { $$=$1%$3; }
		| '(' expr ')' { $$=$2; }
		| DIGIT
		;
%%

void main(){
	printf("\nEnter an expression to calculate: ");
	yyparse();
}

void yyerror(const char *s){
	printf("%s\n", s);
}
