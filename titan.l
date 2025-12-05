%{
#include <stdio.h>
%}

%option noyywrap

%%

0[xX][0-9a-fA-F]+              {printf("HEX: %s\n", yytext);}
0[bB][01]+                     {printf("BINARY: %s\n", yytext);}
0[0-7]+                        {printf("OCTAL: %s\n", yytext);}
[0-9]+\.[0-9]+                 {printf("FLOAT: %s\n", yytext);}
[0-9]+                         {printf("INTEGER: %s\n", yytext);}
[0-9]+([eE][+-]?[0-9]+)        {printf("INT_SCI: %s\n", yytext);}
if|else|while|for|int|float|main|double|char|long|short|return|break|continue|void {printf("KEYWORD: %s\n", yytext);}
[a-zA-Z_][a-zA-Z0-9_]*\(       {printf("FUNC_CALL: %s\n", yytext);}
[a-zA-Z_][a-zA-Z0-9]*         {printf("IDENTIFIER: %s\n", yytext);}
"=="|"!="|">="|"<="|">"|"<"    {printf("RELATIONAL: %s\n", yytext);}
"&&"|"||"|"!"                  {printf("LOGICAL: %s\n", yytext);}
"="|"+"|"-"|"*"|"/"|"%"        {printf("Operator: %s\n", yytext);}
"+="|"-="|"*="|"/="|"%="       {printf("ASSIGN_OP: %s\n", yytext);} //nusrat
[ \t\n]+                       { /* ignore whitespace */ }
.                              {printf("UNKNOWN: %s\n", yytext);} 

%%
/*nusrat*/
int main() {
    yyin = fopen("program.txt", "r");
    yylex();
    return 0;
}               