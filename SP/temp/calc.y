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
expr: expr '+' expr { $$ = $1+$3; }
		| expr '-' expr { $$ = $1-$3; }
		| expr '*' expr { $$ = $1*$3; }
		| expr '/' expr { $$ = $1/$3; }
		| expr '%' expr { $$ = $1%$3; }
		| '(' expr ')' { $$ = $2; }
		| DIGIT
		;
%%

int main(){
	printf("Enter an expression to evaluate: ");
	yyparse();
}

void yyerror(const char *s){
	printf("Error: %s\n", s);
}
