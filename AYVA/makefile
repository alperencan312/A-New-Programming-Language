parser: y.tab.c lex.yy.c
	gcc -o parser y.tab.c
y.tab.c: CS315s22_team15.yacc lex.yy.c
	yacc -v CS315s22_team15.yacc
lex.yy.c: CS315s22_team15.lex
	lex CS315s22_team15.lex

	
