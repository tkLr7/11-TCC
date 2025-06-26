import java_cup.runtime.Symbol;

%%

%cup
%unicode
%line
%column
%class MeuScanner

// Macros
STRING = \"([^\"\\]|\\.)*\" 
NUMERO = -?[0-9]+(\\.[0-9]+)?

%%

// Tokens JSON
{NUMERO}        { return new Symbol(sym.NUMERO, Double.valueOf(yytext())); }
{STRING}        { return new Symbol(sym.STRING, yytext()); }
"true"          { return new Symbol(sym.TRUE); }
"false"         { return new Symbol(sym.FALSE); }
"null"          { return new Symbol(sym.NULL); }
"{"             { return new Symbol(sym.ACHAVE); }
"}"             { return new Symbol(sym.FCHAVE); }
"["             { return new Symbol(sym.ACOLCHETE); }
"]"             { return new Symbol(sym.FCOLCHETE); }
":"             { return new Symbol(sym.DPONTOS); }
","             { return new Symbol(sym.VIRG); }

// Ignora espaços e quebras de linha
[ \t\r\n]+      { /* ignora */ }

// Qualquer outro caractere
.               { System.err.println("Caractere inválido: " + yytext()); }