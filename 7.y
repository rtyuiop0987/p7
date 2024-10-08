%{
    #include <stdio.h>
    #include <stdlib.h>
%}
%token NUM ID TYPE RETURN
%right '='
%left '+' '-'
%left '/' '*'
%%
S: F {printf("Successful\n"); exit(0);}
;
F: TYPE ID '(' PARAM ')' '{' BODY '}'
;
PARAM: TYPE ID
| PARAM ',' TYPE ID
;
BODY: STMT
| BODY STMT
;
STMT: PARAM ';'
| E ';'
| RETURN E ';'
;
E: ID '=' E
| E '+' E 
| E '-' E 
| E '*' E
| NUM
| ID 
;
%%
int main(){
    printf("Function: ");
    yyparse();
}
int yyerror(){
    printf("ERROR\n");
    exit(1);
}
