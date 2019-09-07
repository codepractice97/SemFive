%{
int w_count = 0;
int char_count = 0;
int line_count = 0;
int space_count = 0;
%}

%%
[a-zA-Z]+ {
	w_count++;
	char_count += strlen(yytext);
}
[ ] { space_count++; }
\n { line_count++; }
. {	char_count++; }
%%

int main(){
	yyin = fopen("count.txt", "r");
	yylex();
	printf("Number of words: %d\n", w_count);
	printf("Number of characters: %d\n", char_count);
	printf("Number of blank spaces: %d\n", space_count);
	printf("Number of lines: %d\n", line_count);
	return 0;
}
