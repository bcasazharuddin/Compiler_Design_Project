%{
   // Definition Section
   #include<stdio.h>
   #include<stdlib.h>
   int yylex();
   int yyerror();
   
%}


// tokens
%token Num Id NewLine List

//  Associativity
%left ','
%left '(' ')'

// Rule Section

%%

// Start Statement
start: expr1 NewLine {printf("List of Tuple is valid");exit(0);}
      ;

// List defining statement
expr1: '[' expr ']'
     | List '(' expr ')'
     ;
// tuple CFG  
expr: '(' expr ')' expr
	| expr ',' expr
    | Num 
	| Id 
	|
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
   
   
   
   