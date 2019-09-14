%{
int count = 0;
%}
%%
[0-9]+[a-zA-Z0-9_]* {
	printf("Invalid Token: ");
	printf("%s\n", yytext);
}
[a-zA-Z_]+[a-zA-Z0-9_]* {
	count++;
	printf("Identifier: ");
	printf("%s\n", yytext);
}
. {}
%%

int main(){
yyin = fopen("count_identifiers_input.c","r");
yylex();
printf("Number of identifiers in c file: %d\n", count);
return 0;
}
