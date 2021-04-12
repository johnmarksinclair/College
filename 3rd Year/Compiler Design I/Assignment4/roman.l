%{
	#include "roman.tab.h"
	#include <string.h>
	void yyerror(char *s);
%}

ERROR_EXP (([^IVXLCDM\n]*)|(I[^I\n]+I)|(V[^V(IV)\n]+V)|(X[^X(IX)\n]+X)|(L[^L(XL)\n]+L)|(C[^C(XC)\n]+C)|(D[^D(CD)\n]+D)|(M[^M(CM)\n]+M))

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
{ERROR_EXP} {
	printf("syntax error\n");
	exit(0);
}
%%