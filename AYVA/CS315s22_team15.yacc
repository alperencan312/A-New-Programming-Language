// Tokens

%token BEGIN_STMT
%token END
%token DO
%token WHILE
%token FOR
%token RETURN
%token COMMENT
%token BOOLEAN
%token DELETE
%token REMOVE
%token ADD
%token CARDINALITY
%token READ
%token PRINT
%token UNION
%token INTERSECTION
%token DIFFERENCE
%token SUBSET
%token SUPERSET
%token EMPTY
%token FUNC_DEC
%token MAIN
%token SET
%token IF
%token ELSE
%token EQUAL
%token NOT_EQUAL
%token DOT
%token COMMA
%token END_STMT
%token LESS_THAN
%token LESS_EQ
%token BIGGER_THAN
%token BIGGER_EQ
%token AND
%token OR
%token PLUS
%token MINUS
%token ASSING_OP
%token LP
%token RP
%token LB
%token RB
%token INT
%token NEW
%token STRING
%token IDENTIFIER
%token SET_IDENTIFIER
%token DOUBLE


// Program Start
%start program
%right ASSIGN_OP

%%

program:
	main

// Main
main:
	MAIN LP RP BEGIN_STMT statements END

//statements
statements:
	statement
	|statements statement

// Opening statement
statement:
	expression END_STMT
	|loop
	|conditional
	|functionDec
	|COMMENT

expression:
	intExpr
	|boolExpr
	|setExpr
	|functionCallexpr
	|printExpr
	|doubleExpr
	|setMethods

loop:
	whileLoop
	|forLoop
	|doWhileLoop

conditional:
	ifStatement
	|ifElseStatement

functionDec:
	FUNC_DEC functionCall BEGIN_STMT statements RETURN returnType END


// *********************** EXPRESSIONS *****************************
intExpr:
 	IDENTIFIER ASSING_OP INT
	|IDENTIFIER ASSING_OP IDENTIFIER
	|intExpr PLUS INT
	|intExpr MINUS INT
	|intExpr PLUS IDENTIFIER
	|intExpr MINUS IDENTIFIER

boolExpr:
	IDENTIFIER ASSIGN_OP BOOLEAN
	|IDENTIFIER ASSIGN_OP logicals

setExpr:
	SET_IDENTIFIER ASSING_OP setOperations

functionCallexpr:
	IDENTIFIER ASSING_OP functionCall
	|SET_IDENTIFIER ASSING_OP functionCall

printExpr:
	PRINT LP STRING RP

doubleExpr:
	IDENTIFIER ASSING_OP DOUBLE
	|doubleExpr PLUS DOUBLE
	|doubleExpr MINUS DOUBLE
	|doubleExpr PLUS INT
	|doubleExpr MINUS INT

setMethods:
	setDelete
	|setRemove
	|setAdd
	|setCardinality
	|setRead
	|setPrint
	
// ********************* LOOPS *****************************
whileLoop:
	WHILE LP logicals RP BEGIN_STMT statements END


forLoop:
	FOR LP idenExpr RP BEGIN_STMT statements END

// Explaining idenExpr
idenExpr:
	IDENTIFIER ASSING_OP INT END_STMT logicals END_STMT INT

doWhileLoop:
	DO BEGIN_STMT statements END WHILE LP logicals RP END_STMT

// ******************** CONDITIONALS ***********************
ifStatement:
	IF LP logicals RP BEGIN_STMT statements END

ifElseStatement:
	ifStatement elseStatement

elseStatement:
	ELSE BEGIN_STMT statements END


// **************** MINOR_EXPLANATIONS **************
logicals:
	logical
	|logicals logicalOperator logical

// *************** LOGICAL *********************
logical:
	IDENTIFIER comprassionSigns INT
 	|IDENTIFIER comprassionSigns IDENTIFIER
 	|INT comprassionSigns IDENTIFIER
	|setRelations

 logicalOperator:
 	OR
	|AND

comprassionSigns:
	LESS_THAN
	|LESS_EQ
	|BIGGER_THAN
	|BIGGER_EQ
	|EQUAL
	|NOT_EQUAL

// ***************** SETS *************************
setRelations:
	isEmpty
	|isSubset
	|isSuperset

setOperations:
	setUnion
	|setIntersection
	|setDifference
	|setInit


// ****************************** SET_MINORS *********************
setDelete:
	SET_IDENTIFIER DOT DELETE LP RP
	
setRemove:
	SET_IDENTIFIER DOT REMOVE LP member RP
	
setAdd:
	SET_IDENTIFIER DOT ADD LP member RP
	
setCardinality:
	SET_IDENTIFIER DOT CARDINALITY LP RP

setRead:
	SET_IDENTIFIER DOT READ LP STRING RP
	|SET_IDENTIFIER DOT READ LP RP

setPrint:
	SET_IDENTIFIER DOT PRINT  LP RP
	|SET_IDENTIFIER DOT PRINT  LP STRING RP
	
isEmpty:
	SET_IDENTIFIER DOT EMPTY LP RP
	
isSubset:
 	SET_IDENTIFIER DOT SUBSET LP SET_IDENTIFIER RP
	
isSuperset:
	SET_IDENTIFIER DOT SUPERSET LP SET_IDENTIFIER RP
	
setUnion:
  SET_IDENTIFIER DOT UNION LP SET_IDENTIFIER RP
  
setIntersection:
	SET_IDENTIFIER DOT INTERSECTION LP SET_IDENTIFIER RP
	
setDifference:
	SET_IDENTIFIER DOT DIFFERENCE LP SET_IDENTIFIER RP
	
setInit:
	NEW SET
	|NEW SET LB arguments RB

member:
	argument

// ***************************** FUNCTIONS *******************
functionCall:
	IDENTIFIER LP arguments RP
returnType:
	argument

arguments:
	argument
	|arguments COMMA argument

argument:
	IDENTIFIER
	|INT
	|BOOLEAN
	|SET_IDENTIFIER
	|DOUBLE
	|STRING

%%
#include "lex.yy.c"

int lineNumber =0;
int yyerror( char *s ) { fprintf( stderr, "%s: in line %d\n", s, lineNumber + 1); }

int main() {
   yyparse();
	if(yynerrs < 1){
		printf("Parsing is complete without any error\n");
 	return 0;
	}
}