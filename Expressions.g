
# Numbers
BinaryInteger
	: binStart binDigit { [UNDERSCORE] binDigit };

OctalInteger
	: octStart octDigit { [UNDERSCORE] octDigit };
	
HexadecimalInteger
	: hexStart hexDigit { [UNDERSCORE] hexDigit };
	
DozenalInteger
	: dozStart dozDigit { [UNDERSCORE] dozDigit };
	
DecimalInteger
	: zero
	| nonZero { [UNDERSCORE] digit };
	
Integer
	: BinaryInteger
	| OctalInteger
	| HexadecimalInteger
	| DozenalInteger
	| DecimalInteger;
	
FloatingPoint
	: DecimalInteger PERIOD
	| PERIOD DecimalInteger
	| DecimalInteger PERIOD DecimalInteger;
	
DoublePrecision
	: [FloatingPoint | DecimalInteger] exponent [PLUS | DASH] (FloatingPoint | DecimalInteger);
	
ComplexNumber
	: (DecimalInteger | FloatingPoint | DoublePrecision ) complexEnd;

Number
	: Integer
	| FloatingPoint
	| DoublePrecision
	| ComplexNumber;

# Character	
Character
	: APOSTROPHE 
	( alphaNumeric | escapedCharacters | codedCharacters | symbols | QUOTE | TIC
	) APOSTROPHE;
	

# Strings
StringLiteral
	: QUOTE 
	{ alphaNumeric | escapedCharacters | symbols
	| codedCharacters | APOSTROPHE | TIC | SPACE | TAB
	} QUOTE;
	
FormatLiteral
	: TIC 
	{ alphaNumeric | escapedCharacters | symbols 
	| codedCharacters | APOSTROPHE | QUOTE | SPACE | TAB
	} TIC;
	
ParagraphLiteral
	: QUOTE QUOTE QUOTE NEWLINE
	{ alphaNumeric | escapedCharacters | symbols | codedCharacters
	| APOSTROPHE | QUOTE | TIC | NEWLINE | CARRIAGE | TAB | SPACE
	} NEWLINE QUOTE QUOTE QUOTE;
	
String
	: (StringLiteral | FormatLiteral | ParagraphLiteral) [String];


# Values
PrimitiveLiteral
	: Number
	| Character
	| String;
	
ArrayLiteral
	: LSQB, [ Tuple ], RSQB;
	
SetLiteral
	: LBRACE, [ Tuple ], RBRACE;
	
Identifier
	: (UNDERSCORE | letter) {UNDERSCORE | alphaNumeric};
		
Value
	: PrimitiveLiteral
	| ArrayLiteral
	| SetLiteral
	| Identifier;
	
Tuple
	: COMMA
	| Expression, {COMMA, Expression}, [COMMA];
	

# Expressions

Expression
	: LambdaExpression
	| ConditionalExpression;
	
LambdaExpression
	: ArgumentList, EQUAL RARROW, Expression

ConditionalExpression
	: BooleanExpression, [ If, BooleanExpression, Else, Expression ]
	
BooleanExpression
	: BooleanDisjunction;
	
BooleanDisjunction
	: BooleanComparison, { (Or | Nor), BooleanComparison };
	
BooleanComparison
	: BooleanConjunction, { (Xor | Xnor), BooleanConjunction };
	
BooleanConjunction
	: BooleanNegation, { (And | Nand), BooleanNegation };
	
BooleanNegation
	: {NOT} QualitativeDetermination;
	
	
QualitativeDetermination
	: ComparisonDetermination, { (In | NotIn | Is | IsNot | From | NotFrom ), ComparisonDetermination };
	
ComparisonDetermination
	: BitwiseExpression, { (lt | le | gt | ge | eq | ne | teq | tne), BitwiseExpression };
	
	
BitwiseExpression
	: BitwiseDisjunction;
	
BitwiseDisjunction
	: BitwiseComparison, { PIPE, BitwiseComparison };
	
BitwiseComparison
	: BitwiseConjunction, { CARAT, BitwiseConjunction };
	
BitwiseConjunction
	: BitshiftExpression, { AMPERSAND, BitshiftExpression };
	

BitshiftExpression
	: ArithmenticExpression, { (bsl | bsr | bsf), ArithmenticExpression };
	

ArithmeticExpression
	: AdditiveExpression;
	
AdditiveExpression
	: MultilplicativeExpression, { (PLUS | DASH], MultilplicativeExpression };
	
MultilplicativeExpression
	: UnaryExpression, { (STAR | SLASH | SLASH SLASH | PERCENT) UnaryExpression };
	
UnaryExpression
	: { PLUS | DASH | TILDE }, ExponentialExpression
	| { POUND | AMPERSAND }, ExponentialExpression
	| BSLASH, ExponentialExpression, BSLASH ;
	
ExponentialExpression
	: LogicalExpression, { STAR STAR, LogicalExpression };
	
LogicalExpression
	: ReferenceExpression, { (PIPE PIPE | AMPERSAND AMPERSAND | QUESTION QUESTION | 
	
ReferenceExpression
	: (Value | LPAREN, Expression, RPAREN), { ReferenceEnd };
	
ReferenceEnd
	: [QUESTION | EXCLAM] PERIOD Identifier
	| [QUESTION | EXCLAM] LBRACE, SliceExpression, RBRACE
	| [QUESTION | EXCLAM] LPAREN, Tuple, RPAREN;
	
SliceExpression
	: BooleanExpression, { (COMMA | SEMI | COLON), BooleanExpression );
	
	