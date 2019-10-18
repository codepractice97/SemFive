%option noyywrap
%{
#include "y.tab.h"
%}

%%
[0-9]+ { yylval = atoi(yytext); return DIGIT; }
"\n" return NEWLINE;
. return yytext[0];
%%
