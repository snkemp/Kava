
epsilon: '';

# Numbers

0;1;2;3;4;5;6;7;8;9;

zero: 0;
nonZero: 1|2|3|4|5|6|7|8|9;
digit: zero | nonZero;
binDigit: 0|1;
octDigit: 0|1|2|3|4|5|6|7;
hexDigit: 0|1|2|3|4|5|6|7|8|9|a|b|c|d|e|f|A|B|C|D|E|F;
dozDigit: 0|1|2|3|4|5|6|7|8|9|d|e|D|E;

binStart: 0 (b|B);
octStart: 0 (o|O);
hexStart: 0 (x|X);
dozStart: 0 (d|D);

complexEnd: j;
exponent: e | E;

# Characters
a;b;c;d;e;f;g;h;i;j;k;l;m;n;o;p;q;r;s;t;u;v;w;x;y;z;
A;B;C;D;E;F;G;H;I;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z;

upperCase: A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z;
lowerCase: a|b|c|d|e|f|g|h|i|j|k|l|m|n|o|p|q|r|s|t|u|v|w|x|y|z;
letter: lowerCase | upperCase;

alphaNumeric: letter | digit;

stringPrefix: r|b|u|f;

# Escaped Characters
alarm: BSLASH a;
break: BSLASH b;
formfeed: BSLASH f;
newline: BSLASH n;
carriage: BSLASH r;
tab: BSLASH t;
vertical: BSLASH v;

quote: BSLASH QUOTE;
apostrophe: BSLASH APOSTROPHE;
tic: BSLASH TIC;
bslash: BSLASH BSLASH;

escapedCharacters: alarm | break | formfeed | newline | carriage | tab | vertical | quote | apostrophe | tic | bslash;

octalCode: BSLASH octDigit octDigit octDigit;
hexCode: BSLASH (x|X) hexDigit hexDigit;
uniCode
	: BSLASH u hexDigit hexDigit hexDigit hexDigit 
	| BSLASH U hexDigit hexDigit hexDigit hexDigit hexDigit hexDigit hexDigit hexDigit;

codedCharacters: octalCode | hexCode | uniCode;

# Special Characters

NEWLINE: '\n';
#CARRIAGE: '\r';
TAB: '\t';
SPACE: ' ';
COMMENT
	: SEMI SEMI SEMI { alphaNumeric | symbols | QUOTE | TIC | APOSTROPHE | NEWLINE | TAB | SPACE } SEMI SEMI SEMI 
	| SEMI SEMI { alphaNumeric | symbols | QUOTE | TIC | APOSTROPHE | TAB | SPACE } NEWLINE;

# Symbols
TILDE: '~';
TIC: '`';
EXCLAM: '!';
AT: '@';
POUND: '#';
DOLLAR: '$';
PERCENT: '%';
CARAT: '^';
AMPERSAND: '&';
STAR: '*';
LPAREN: '(';
RPAREN: ')';
DASH: '-';
UNDERSCORE: '_';
PLUS: '+';
EQUAL: '=';
LBRACE: '{';
LSQB: '[';
RBRACE: '}';
RSQB: ']';
PIPE: '|';
BSLASH: '\\';
COLON: ':';
SEMI: ';';
QUOTE: '"';
APOSTROPHE: '\'';
LARROW: '<';
COMMA: ',';
RARROW: '>';
PERIOD: '.';
QUESTION: '?';
SLASH: '/';

symbols
	: TILDE | TIC | EXCLAM | AT | POUND | DOLLAR | PERCENT | CARAT | AMPERSAND | SLASH
	| SSTAR | LPAREN | RPAREN | DASH | UNDERSCORE | PLUS | EQUAL | LBRACE | RBRACE
	| LSQB | RSQB | PIPE | COLON | SEMI | QUOTE | LARROW | COMMA | RARROW | PERIOD;

# Keywords
Import; Export;
If; Elif; Else; When; Unless;
Attempt; Ignore; Catch; Finally;
For; Loop; Do; While; Until; Once;
Otherwise; Then;
With; Using;
Switch; FallThrough, Case; Default;
Break; Continue;
Yield; Fetch; Send; Deliver; Return; Throw; Await; 

Public; Private; Protected; Async;

True: T r u e | V r a i; 
False: F a l s e | F a u x;
Null; Nothing; Undefined;

Not;
And; Nand; Or; Nor; Xor; Xnor;
Is; IsNot; In; NotIn; From; NotFrom;
IsA: I s A [n];

lt: LARROW;
le: LARROW EQUAL;
gt: RARROW;
ge: RARROW EQUAL;
eq: EQUAL EQUAL;
ne: EXCLAM EQUAL;
teq: EQUAL EQUAL EQUAL;
tne: EXCLAM EQUAL EQUAL;

bsl: LARROW LARROW;
bsr: RARROW RARROW;
bdf: RARROW RARROW RARROW;

As; To; Of;

Inc; Dec;

Def; Function;
Operator; Unary; Prefix; Postfix;
Property; Get; Set;

Class; Enum; Struct; Atom; Interface;

Var;
Int; Float; Double; Complex;
Char; String;
Array; Matrix;
Func;

type
	: Var
	| Int | Float | Double | Complex 
	| Char | String 
	| Array | Matrix 
	| Func
	| upperCase {[UNDERSCORE] letter};


