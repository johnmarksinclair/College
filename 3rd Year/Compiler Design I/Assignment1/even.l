%{
    int evens = 0;
%}

%%

[0-9]*[0]  { evens++; }
[0-9]*[2]  { evens++; }
[0-9]*[4]  { evens++; }
[0-9]*[6]  { evens++; }
[0-9]*[8]  { evens++; }
[0-9]*
\n
.

%%

int main() 
{
    yylex();
    printf("%d\n", evens);
    return 0;
}