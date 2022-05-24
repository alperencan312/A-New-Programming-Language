
NEW_LINE 	"\n"
MAIN        main
EQUAL       ==
NOT_EQUAL   !=
DOT         [.]
COMMA       [,]
END_STMT    [:]
LESS_THAN   <
LESS_EQ     <=
BIGGER_THAN >
BIGGER_EQ   >=
AND         \&\&
OR          \|\|
PLUS        [+]
MINUS       [-]
ASSING_OP   <<
STRING      ["][^"]*["]
IF          if
ELSE        else
FUNC_DEC    func
LP          \(
RP          \)
LB          \{
RB          \}
DIGIT       [0-9]
INT         ({DIGIT}+|{MINUS}{DIGIT}+)
DOUBLE 		{DIGIT}+{DOT}{DIGIT}+|{MINUS}{DIGIT}+{DOT}{DIGIT}+
LOW_CHAR    [a-z]
UP_CHAR     [A-Z]
NEW         new
BOOLEAN     (true|false)
SET         Set
BEGIN_STMT  begin
IDENTIFIER  {LOW_CHAR}({DIGIT}|{LOW_CHAR})+
DO          do
WHILE       while
FOR         for
RETURN      return
COMMENT     [#][^#]*[#]
END         end
SET_IDENTIFIER    {UP_CHAR}({DIGIT}|{UP_CHAR})+
DELETE 		delete
REMOVE 		remove
ADD 		add
CARDINALITY getCardinality
READ 		read
PRINT 		print
UNION 		union
INTERSECTION intersection
DIFFERENCE 	difference
SUBSET 		isSubset
SUPERSET 	isSuperset
EMPTY 		isEmpty


%option yylineno
%%

{BEGIN_STMT}  return BEGIN_STMT;
{END}         return END;
{DO}          return DO;
{WHILE}       return WHILE ;
{FOR}         return FOR ;
{RETURN}      return RETURN;
{COMMENT}     return COMMENT ;
{BOOLEAN}     return BOOLEAN ;
{DELETE} 	  return DELETE ;
{REMOVE} 	  return REMOVE ;
{ADD} 		  return ADD ;
{CARDINALITY} return CARDINALITY ;
{READ} 		  return READ ;
{PRINT} 	  return PRINT ;
{UNION} 	  return UNION ;
{INTERSECTION} return INTERSECTION ;
{DIFFERENCE}  return DIFFERENCE ;
{SUBSET} 	  return SUBSET ;
{SUPERSET} 	  return SUPERSET ;
{EMPTY} 	  return EMPTY ;
{FUNC_DEC}    return FUNC_DEC ;
{ASSING_OP}   return ASSING_OP ;
{MAIN} 		  return MAIN ;
{SET} 		  return SET ;
{IF}          return IF ;
{ELSE}        return ELSE ;
{NEW}         return NEW;
{EQUAL}       return EQUAL ;
{NOT_EQUAL}   return NOT_EQUAL;
{DOT}         return DOT ;
{COMMA}       return COMMA ;
{END_STMT}    return END_STMT ;
{LESS_THAN}   return LESS_THAN ;
{LESS_EQ}     return LESS_EQ ;
{BIGGER_THAN} return BIGGER_THAN ;
{BIGGER_EQ}   return BIGGER_EQ ;
{AND}         return AND ;
{OR}          return OR ;
{PLUS}        return PLUS ;
{MINUS}       return MINUS ;
{LP}          return LP ;
{RP}          return RP ;
{LB}          return LB ;
{RB}          return RB ;
{INT}         return INT ;
{DOUBLE}	  return DOUBLE;
{STRING}      return STRING ;
{IDENTIFIER}  return IDENTIFIER ;
{SET_IDENTIFIER}    return SET_IDENTIFIER ;
[ \t] ;
{NEW_LINE} 	  { extern int lineNumber; lineNumber++;}
%%

int yywrap(void){
	return 1;
}