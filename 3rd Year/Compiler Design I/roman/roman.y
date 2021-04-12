%{
  #include <stdlib.h>
  #include <stdio.h>
  #include <string.h>
  int yylex();
  void yyerror(char *s);
%}

%union {
	int num;
}
%token EOL
%token <num> NUM
%type <num> num chars

%%
recursive:  
| recursive num EOL { printf("%d\n", $2); } 
;
num: chars
| num chars {$$ = $1 + $2;}
;
chars:
| NUM {$$ = yylval.num;}
;
%%

int main(){
    yyparse();
    return 0;
}

void yyerror(char *s){
    printf("syntax error");
    exit(0);
}