%{

char year[2];
int parsedYear = 0;
int currentYear = 21;
int passedYears = 0;
    
%}

YEAR [0-9]{2}
SUBYEAR [0-9]
OLDCOUNTIES C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LK|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|TN|TS|W|WD|WH|WX|WW
COUNTIES C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|T|W|WH|WX|WW
SEQUENCE [0-9]{1,6}
NUMERROR [0-9]+
COUNTYERROR [a-zA-Z]*

%%

{YEAR}"-"{OLDCOUNTIES}"-"{SEQUENCE}         {strncpy(year, yytext, 2); parsedYear = atoi(year); if(parsedYear > currentYear) {passedYears = (100+currentYear)-parsedYear;} else {passedYears = currentYear-parsedYear;} printf("%d\n", passedYears);}
{YEAR}{SUBYEAR}"-"{COUNTIES}"-"{SEQUENCE}   {strncpy(year, yytext, 2); parsedYear = atoi(year); passedYears = currentYear-parsedYear; printf("%d\n", passedYears);}
{YEAR}"-"{OLDCOUNTIES}"-"{NUMERROR}         {printf("INVALID\n");}
{YEAR}{SUBYEAR}"-"{COUNTIES}"-"{NUMERROR}   {printf("INVALID\n");}
{YEAR}"-"{COUNTYERROR}                      {printf("INVALID\n");}
{YEAR}{SUBYEAR}"-"{COUNTYERROR}             {printf("INVALID\n");}
^{NUMERROR}                                 {printf("INVALID\n");}
^{COUNTYERROR}                              {printf("INVALID\n");}
\t
\n
.

%%

int main() 
{
    yylex();
    return 0;
}