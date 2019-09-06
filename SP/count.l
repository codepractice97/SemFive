%{
int char_num = 0;
int line_num = 0;
%}

%%
. { char_num++; }
\n { line_num++; }
%%

int main(){
	yyin = fopen("q1input.txt", "r");
	yylex();
	printf("Number of characters: %d\n", char_num);
	printf("Number of line_num: %d\n", line_num);
	return 0;
}
