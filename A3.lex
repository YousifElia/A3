import java_cup.runtime.*;
%%
%implements java_cup.runtime.Scanner
%type Symbol
%function next_token
%state COMMENT
%class A3Scanner
%eofval{ return null;
%eofval}
I=[a-zA-Z][a-zA-Z0-9]*
N=[0-9]+(\.[0-9]+)?
%%
<COMMENT>.|\n|\r {}
<YYINITIAL>{N} {return new Symbol(A3Symbol.NUMBER);}
<YYINITIAL>"\""[^\"\n]*"\""|"'"[^'\n]*"'" {return new Symbol(A3Symbol.QUOTED);}
<YYINITIAL>[ \t\r\n] {}
<YYINITIAL>"WRITE" {return new Symbol(A3Symbol.WRITE);}
<YYINITIAL>"READ" {return new Symbol(A3Symbol.READ);}
<YYINITIAL>"IF" {return new Symbol(A3Symbol.IF);}
<YYINITIAL>"ELSE" {return new Symbol(A3Symbol.ELSE);}
<YYINITIAL>"RETURN" {return new Symbol(A3Symbol.RETURN);}
<YYINITIAL>"BEGIN" {return new Symbol(A3Symbol.BEGIN);}
<YYINITIAL>"END" {return new Symbol(A3Symbol.END);}
<YYINITIAL>"MAIN" {return new Symbol(A3Symbol.MAIN);}
<YYINITIAL>"STRING"|"INT"|"REAL" {return new Symbol(A3Symbol.TYPE);}
<YYINITIAL>{I} {return new Symbol(A3Symbol.ID);}
<YYINITIAL>";" {return new Symbol(A3Symbol.SEMICOLON);}
<YYINITIAL>"," {return new Symbol(A3Symbol.COMMA);}
<YYINITIAL>"(" {return new Symbol(A3Symbol.LPAREN);}
<YYINITIAL>")" {return new Symbol(A3Symbol.RPAREN);}
<YYINITIAL>"+"|"-" {return new Symbol(A3Symbol.ADD);}
<YYINITIAL>"*"|"/" {return new Symbol(A3Symbol.MULTIPLY);}
<YYINITIAL>"==" {return new Symbol(A3Symbol.EQ);}
<YYINITIAL>"!=" {return new Symbol(A3Symbol.NOTEQ);}
<YYINITIAL>"=" {return new Symbol(A3Symbol.ASSIGN);}
<YYINITIAL>"/**" {yybegin(COMMENT);}
<COMMENT>"**/" {yybegin(YYINITIAL);}
<COMMENT>. {}
<YYINITIAL>. {return new Symbol(A3Symbol.error);}
