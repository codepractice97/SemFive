%option noyywrap
%{
#include "y.tab.h"
%}

%%
[0-9]+ return DIGIT;
[a-z][a-z0-9_]* return IDEN;
"\n" return NEWLINE;
. return yytext[0];
%%
