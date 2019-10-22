%{
#include <stdio.h>
extern int yylex();
void yyerror(const char *s);
%}

%token A B NEWLINE

%%
line: A A A A A A A A A expr B NEWLINE { printf("Valid String\n"); return 0; }
		;
expr: expr A
		| A
		;
%%

int main(){
	printf("Enter string to match: ");
	yyparse();
}

void yyerror(const char *s){
	printf("Invalid String\n");
}
