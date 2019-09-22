%{
int i,j = 0;
%}

%%
"abcd" {
	for (i=0; i < yyleng; i++){
		for (j=0; j < yyleng - i; j++){
			printf("%c",yytext[j]);
		}
		printf("\n");
	}
}
%%

int main(){
	yylex();
	return 0;
}
