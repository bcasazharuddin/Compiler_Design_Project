%{
   // Definition Section
   #include<stdio.h>
   #include<stdlib.h>
   int yylex();
   int yyerror();
   
%}


// tokens
%token Num Id NewLine List

// Rule Section

%%

// Start Statement
start: S NewLine {printf("List of Tuple is valid");exit(0);}
      ;

// List defining statement
S: '[' S1 ']'
     | List '(' S1 ')'
     ;
// tuple CFG  
S1: '(' tuple ')'
	| '(' tuple ')' ','  S1	
    ;
tuple : value ',' tuple
    | value 
    ;
value : Num 
	| Id 
	;

%%

int yyerror(char const *s)
{
   printf("List of tuple is not valid : Syntax Error ");
   return 1;
}

// driver code
int main()
{
   printf("Please Enter List of Tuple:\n");
   yyparse();
   return 0;
   
}   
   
   
   
   