import java_cup.runtime.Symbol;

%%

%cup
%unicode
%line
%column
%class JsonScanner

// Macros
STRING = "[^"]"
NUMERO = -?[0-9]+(.[0-9]+)?

%%

// Tokens JSON
{STRING}        { return new Symbol(sym.STRING, yytext()); }
{NUMERO}        { return new Symbol(sym.NUMERO, Double.valueOf(yytext())); }
"true"          { return new Symbol(sym.TRUE); }
"false"         { return new Symbol(sym.FALSE); }
"null"          { return new Symbol(sym.NULL); }
"{"             { return new Symbol(sym.ACHAVE); }
"}"             { return new Symbol(sym.FCHAVE); }
"["             { return new Symbol(sym.ACOLCHETE); }
"]"             { return new Symbol(sym.FCOLCHETE); }
":"             { return new Symbol(sym.DPONTOS); }
","             { return new Symbol(sym.VIRG); }
// Espaços e quebras de linha são ignorados
[ \t\r\n]+      { / ignora */ }

// Caracteres inválidos
.               { System.err.println("Caractere inválido: " + yytext()); }