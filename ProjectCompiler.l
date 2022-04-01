%{
   /* Definiton Section */
   #include<stdio.h>
   #include "y.tab.h"

%}

/* Rule Section */
%%

[l][i][s][t]              return List; //list value regex
 
[0-9]+                    return Num;  // integer value of regex

[a-zA-Z_][A-Za-z_0-9]*    return Id;  // string  value of  regex
.                         return *yytext;

\n                        return NewLine;


%%


int yywrap(){
  return 1;
}  