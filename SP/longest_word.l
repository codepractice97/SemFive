%{
char a[100];
char *l_word;
int l_len = 0;
%}

%%
[a-zA-Z]+ {
	int t_len = 
}
%%

int manin(){
	printf("Enter a string: ");
	scanf("%s", a);
	yy_scan_string(a);
	yylex();
}
