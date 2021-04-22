%{
	#include "roman.tab.h"
	#include <string.h>
	void yyerror(char *s);
%}

ERROR1 ([^IVXLCDM\n]*)
ERROR2 (I[^I\n]+I)
ERROR3 (V[^V(IV)\n]+V)
ERROR4 (X[^X(IX)\n]+X)
ERROR5 (L[^L(XL)\n]+L)
ERROR6 (C[^C(XC)\n]+C)
ERROR7 (D[^D(CD)\n]+D)
ERROR8 (M[^M(CM)\n]+M)
ERROR_EXP (ERROR1|ERROR2|ERROR3|ERROR4|ERROR5|ERROR6|ERROR7|ERROR8)

%%
IV      {yylval.num = 4; return NUM;}
IX      {yylval.num = 9; return NUM;}
XL      {yylval.num = 40; return NUM;}
XC      {yylval.num = 90; return NUM;}
CD      {yylval.num = 400; return NUM;}
CM      {yylval.num = 900; return NUM;}
I{1,3}  {yylval.num = strlen(yytext); return NUM;}
V       {yylval.num = 5; return NUM;}
X       {yylval.num = 10; return NUM;}
L       {yylval.num = 50; return NUM;}
C       {yylval.num = 100; return NUM;}
D       {yylval.num = 500; return NUM;}
M       {yylval.num = 1000; return NUM;}
\n      {return EOL;}
{ERROR_EXP} {printf("syntax error\n"); exit(0);}
%%