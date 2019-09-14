%{
char a[100];
%}

%%
[a-z] {
	char ch = yytext[0];
	ch += 3;
	if (ch > 'z')
		ch -= (26);
	printf("%c", (char) ch);
}
[A-Z] {
	char ch = yytext[0];
	ch += 3;
	if (ch > 'Z')
		ch -= (26);
	printf("%c", (char) ch);
}
%%

int main(){
	printf("Enter String: ");
	scanf("%s",a);
	yy_scan_string(a);
	yylex();
}
