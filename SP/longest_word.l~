%{
char a[100];
char *l_word;
int l_len = 0;
%}

%%
[a-zA-Z]+ {
	int t_len = strlen(yytext);
	if (t_len > l_len){
		l_len = t_len;
		l_word = yytext;
	}
}
.
%%

int main(){
	printf("Enter a string: ");
	scanf("%[^\n]%*c", a);
	yy_scan_string(a);
	yylex();
	printf("Longest word is '%.*s' of length %d\n", l_len, l_word, l_len);
	return 0;
}
