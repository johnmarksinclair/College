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
%type <num> num letters

%%
numlist:  
 | numlist num EOL { printf("%d\n", $2); } 
 ;
num: letters
| num letters {$$ = $1 + $2;}
;
letters:
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