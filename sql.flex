import java_cup.runtime.Symbol;

%%

%cup
%unicode
%line
%column
%class MeuScanner

// Macros
IDENT    = [a-zA-Z_][a-zA-Z_0-9]*
NUMERO   = [0-9]+
STRING   = \'[^']*\' | \"[^\"]*\"

%%

// Palavras-chave (em maiúsculas apenas, sem case-insensitive)
"SELECT"       { return new Symbol(sym.SELECT); }
"FROM"         { return new Symbol(sym.FROM); }
"WHERE"        { return new Symbol(sym.WHERE); }

// Operadores
"="            { return new Symbol(sym.IGUAL); }
"<"            { return new Symbol(sym.MENOR); }
">"            { return new Symbol(sym.MAIOR); }
","            { return new Symbol(sym.VIRG); }
";"            { return new Symbol(sym.PONTOEVIRG); }
"*"            { return new Symbol(sym.MUL); }  // Faltava esse terminal

// Identificadores e literais
{IDENT}        { return new Symbol(sym.IDENT, yytext()); }
{NUMERO}       { return new Symbol(sym.NUMERO, Integer.valueOf(yytext())); }
{STRING}       { return new Symbol(sym.STRING, yytext()); }

// Espaços
[ \t\r\n]+     { /* ignora */ }

// Qualquer outro caractere
.              { System.err.println("Caractere inválido: " + yytext()); }