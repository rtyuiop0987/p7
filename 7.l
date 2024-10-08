%{
    #include "y.tab.h"
%}
%%
"int"|"float"|"char"|"void" return TYPE;
"return" return RETURN;
[0-9]+ return NUM;
[a-zA-Z0-9]* return ID;
[\t \n] ;
. return yytext[0];
%%
