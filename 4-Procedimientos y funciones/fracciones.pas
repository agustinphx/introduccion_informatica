Program fracciones;

Var
	X,Y,W,Z,Frac1,Frac2:real;
Procedure DevolverSuma(A,B,C,D:real);	
Begin	
Frac1:=D*A + B*C;
Frac2:=B*D;
writeln('el numerador es :' ,Frac1:2:2);
writeln('el denominador es :' ,Frac2:2:2);
end;

Begin
writeln('ingrese el primer numerador');readln(X);
writeln('ingrese el primer denominador');readln(Y);
writeln('ingrese el segundo numerador');readln(W);
writeln('ingrese el segundo denominador');readln(Z);
DevolverSuma(X,Y,W,Z);readln();
end.
