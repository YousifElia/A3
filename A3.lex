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
<YYINITIAL>"\""[^\"\n]*"\""|"'"[^'\n]*"'" {return new Symbol(A3Symbol._3);}
<YYINITIAL>[ \t\r\n] {}
<YYINITIAL>"WRITE" {return new Symbol(A3Symbol._5);}
<YYINITIAL>"READ" {return new Symbol(A3Symbol._4);}
<YYINITIAL>"IF" {return new Symbol(A3Symbol.IF);}
<YYINITIAL>"ELSE" {return new Symbol(A3Symbol._6);}
<YYINITIAL>"RETURN" {return new Symbol(A3Symbol._7);}
<YYINITIAL>"BEGIN" {return new Symbol(A3Symbol._8);}
<YYINITIAL>"END" {return new Symbol(A3Symbol._9);}
<YYINITIAL>"MAIN" {return new Symbol(A3Symbol._10);}
<YYINITIAL>"STRING"|"INT"|"REAL" {return new Symbol(A3Symbol._11);}
<YYINITIAL>{I} {return new Symbol(A3Symbol.ID);}
<YYINITIAL>[;$] {return new Symbol(A3Symbol._12);}
<YYINITIAL>"," {return new Symbol(A3Symbol._13);}
<YYINITIAL>"(" {return new Symbol(A3Symbol._1);}
<YYINITIAL>")" {return new Symbol(A3Symbol._2);}
<YYINITIAL>"+"|"-" {return new Symbol(A3Symbol.ADD);}
<YYINITIAL>"*"|"/" {return new Symbol(A3Symbol._14);}
<YYINITIAL>"==" {return new Symbol(A3Symbol.EQ);}
<YYINITIAL>"!=" {return new Symbol(A3Symbol._15);}
<YYINITIAL>"=" {return new Symbol(A3Symbol._16);}
<YYINITIAL>"/**" {yybegin(COMMENT);}
<COMMENT>"**/" {yybegin(YYINITIAL);}
<COMMENT>. {}
<YYINITIAL>. {return new Symbol(A3Symbol.error);}
