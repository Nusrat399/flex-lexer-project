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
"("                            {printf("LPAREN: %s\n", yytext);}
")"                            {printf("RPAREN: %s\n", yytext);}
"{"                            {printf("LBRACE: %s\n", yytext);}
"}"                            {printf("RBRACE: %s\n", yytext);}
"["                            {printf("LBRACKET: %s\n", yytext);}
"]"                            {printf("RBRACKET: %s\n", yytext);}
";"                            {printf("SEMICOLON: %s\n", yytext);}
":"                            {printf("COLON: %s\n", yytext);}
","                            {printf("COMMA: %s\n", yytext);}
"."                            {printf("DOT: %s\n", yytext);}
"?"                            {printf("QUESTION: %s\n", yytext); }
"->"                           {printf("PTR_ACCESS: %s\n", yytext);}
"&"                            {printf("ADDRESS_OP: %s\n", yytext);}
"<<="|">>="                    {printf("BITWISE_ASSIGN: %s\n", yytext);}
\"([^\\\"]|\\.)*\"             {printf("STRING: %s\n", yytext); } //jiniya
'(\\.|[^\\'])'                 {printf("CHAR: %s\n", yytext); }
\/\/[^\n]*                     {printf("COMMENT_SINGLE: %s\n", yytext); }
"<<"                           {printf("SHIFT_LEFT: %s\n", yytext); }
">>"                           {printf("SHIFT_RIGHT: %s\n", yytext); }
"^"                            {printf("BIT_XOR: %s\n", yytext); }
"~"                            {printf("BIT_NOT: %s\n", yytext); }
"++"                           {printf("INCREMENT: %s\n", yytext); }
"--"                           {printf("DECREMENT: %s\n", yytext); }
"=>"                           {printf("LAMBDA_ARROW: %s\n", yytext); }
\#[a-zA-Z_]+                   {printf("PREPROCESSOR: %s\n", yytext); }
"@"                            {printf("AT_SYMBOL: %s\n", yytext); }
"#"                            {printf("HASH_SYMBOL: %s\n", yytext); }
"&="                           {printf("AND_ASSIGN: %s\n", yytext); }
"|="                           {printf("OR_ASSIGN: %s\n", yytext); }
"^="                           {printf("XOR_ASSIGN: %s\n", yytext); }
"\\n"|"\\t"|"\\r"|"\\0"        {printf("ESCAPE_CHAR: %s\n", yytext); }
">>>"                          {printf("SHIFT_UNSIGNED_RIGHT: %s\n", yytext); } //sorna
"\.\.\."                       {printf("ELLIPSIS: %s\n", yytext); }
0[bB][01]+\.[01]+              {printf("BINARY_FLOAT: %s\n", yytext); }
"::"                           {printf("SCOPE_RESOLUTION: %s\n", yytext); }
"%"[a-zA-Z]                    {printf("FORMAT_SPECIFIER: %s\n", yytext); }
#include[ \t]*<[^>]+>          {printf("INCLUDE_DIRECTIVE: %s\n", yytext); }
"<=>"                          {printf("THREE_WAY_COMPARE: %s\n", yytext); }
\.[0-9]+                       {printf("DOT_FLOAT: %s\n", yytext); }
"%%"                           {printf("DOUBLE_PERCENT: %s\n", yytext);}
":::"                          {printf("TRIPLE_COLON: %s\n", yytext);}
"??"                           {printf("NULL_COALESCE: %s\n", yytext);}
"??="                          {printf("NULL_COALESCE_ASSIGN: %s\n", yytext);}
"@@"                           {printf("DOUBLE_AT: %s\n", yytext);}
"\$[a-zA-Z_][a-zA-Z0-9_]*"     {printf("DOLLAR_IDENTIFIER: %s\n", yytext);}
"##"                           {printf("DOUBLE_HASH: %s\n", yytext);}
"<\*>"                         {printf("WILDCARD_OPERATOR: %s\n", yytext);}
"!!"                           {printf("DOUBLE_NOT: %s\n", yytext);}
"%%="                          {printf("MOD_ASSIGN_DOUBLE_PERCENT: %s\n", yytext);}
[ \t\n]+                       { /* ignore whitespace */ }
.                              {printf("UNKNOWN: %s\n", yytext);}   //shahed

%%
/*nusrat*/
int main() {
    yyin = fopen("program.txt", "r");
    yylex();
    return 0;

}               


