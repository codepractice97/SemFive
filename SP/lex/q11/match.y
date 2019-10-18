%{
#include <stdio.h>
extern int yylex();
void yyerror(const char *s);
%}

%token A B NEWLINE

%%
line: expr NEWLINE { printf("Valid String\n"); return 0; }
		;
expr: A expr B
		| A B
		;
%%

int main(){
	printf("Enter string to check: ");
	yyparse();
	return 0;
}

void yyerror(const char *s){
	printf("Invalid String\n");
}
