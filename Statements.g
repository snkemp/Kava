
# Single Statements

ImportStatement
	: Import, CapsuleName, [Alias], SEMI
	| Import, From, CapsuleName, LBRACE, 
	{ CapsuleName, [Alias], { COMMA, CapsuleName, [Alias]}, [COMMA] }, RBRACE, SEMI;
	
ExportStatement
	:;
	
	
	
WhenStatement
	: SimpleStatement, (When | Unless), Expression;
	

	
# Simple Statements 

BreakStatement
	: Break, [Identifier];
	
ContinueStatement
	: Continue, [Identifier];
	
YieldStatement
	: Yield, Expression;
	
FetchStatement
	: Fetch, Identifier;
	
DeliverStatement
	: Deliver Expression;
	
ReturnStatement
	: Return [Expression];
	
ThrowStatement
	: Throw Expression;
	
AwaitStatement
	: Await Identifier;
	
AssignStatement
	: Expression, EQUALS, EXPRESSION;
	
ProcedureStatement
	: Expression;
	
SimpleStatement
	: BreakStatement
	| ContinueStatement
	| YieldStatement
	| FetchStatement
	| DeliverStatement
	| ReturnStatement
	| ThrowStatement
	| AwaitStatement
	| AssignStatement
	| ProcedureStatement;




# Complex Statements

IfStatement
	: If, BooleanExpression, ScopedStatement,
	[ ElifStatement | ElseStatement ];
	
ElifStatement
	: Elif, BooleanExpression, ScopedStatement,
	[ ElifStatement | ElseStatement ];

ElseStatement
	: Else, ScopedStatement;
	
	
AttemptStatement
	: Attempt, ScopedStatement, IgnoreStatement;
	
IgnoreStatement
	: Ignore, Identifier, SEMI, IgnoreStatement
	| ExceptStatement;
	
ExceptStatement
	: Except, Identifier, ScopedStatement, ExceptStatement
	| FinallyStatement;
	
FinallyStatement
	: Finally, ScopedStatement;
	
ForStatement
	: For, [LoopName], Identifier, In, Expression, ScopedStatement, [ThenStatement];
	
LoopStatement
	: Loop, [LoopName], Declaration, SEMI, Expression, SEMI, Assignment, ScopedStatement, [ThenStatement];
	
DoStatement
	: Do, [LoopName], ScopedStatement, (While | Until), Expression, SEMI;
	
WhileStatement
	: (While | Until), [LoopName], Expression, ScopedStatement, [ThenStatement];
	
ThenStatement
	: [Then, ScopedStatement], [OtherwiseStatement];
	
OtherwiseStatement
	: Otherwise, ScopedStatement;
	
WithStatement
	: With, Identifier, As, Identifier, ScopedStatement;
	
UsingStatement
	: Using, Identifier, ScopedStatement;
	
SwitchStatement
	: Switch, Expression, LBRACE, {CaseStatement}, RBRACE;
	
CaseStatement
	: [FallThrough] Case, Tuple, ScopedStatement;
	
	
ComplexStatement
	: IfStatement
	| AttemptStatement
	| ForStatement
	| LoopStatement
	| DoStatement
	| WhileStatement
	| WithStatement
	| UsingStatement
	| SwitchStatement
	;

# Other

Alias: As, Identifier;

LoopName
	: LSQB, Identifier, RSQB;

ArgumentList
	:; # TODO