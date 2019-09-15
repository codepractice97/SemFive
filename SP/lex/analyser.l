%%
[+|-|*|%|/] { printf("%s is a arithmatic operator\n", yytext); }
"<<"+ { printf("%s is a insertion/extraction operator\n", yytext); }
">>"+ { printf("%s is a insertion/extraction operator\n", yytext); }
[>|<|=|<=|>=|!=|==] { printf("%s is a relational operator\n", yytext); } 
[&&|!|\|\|] { printf("%s is a logical operator\n", yytext); }
["auto" | "break" | "case" | "char" | "const" | "continue" | "default" | "do" | "double" | "else" | "enum" | "extern" | "float" | "for" | "goto" | "if" | "int" | "long" | "register" | "return" | "short" | "signed" | "sizeof" | "static" | "struct" | "switch" | "typedef" | "union" | "unsigned" | "void" | "volatile" | "while"] { printf("%s is a keyword\n", yytext); } 
[A-Za-z][0-9A-Za-z]* { printf("%s is a identifier\n", yytext); }
[0-9]+ { printf("%s is an integer\n", yytext); }
[0-9]+\.[0-9]+ { printf("%s is a decimal\n", yytext); }
\/\/.*  { printf("%s is a singleline comment\n", yytext); }
\/\*[^(\/*)]*\*\/ { printf("%s is a multiline comment\n", yytext); }
[.|\n] {}
%%

int main(){
	yyin = fopen("analyser_input.txt","r");
	yylex();
	return 0;
}
