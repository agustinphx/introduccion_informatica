{A partir de dos fracciones devolver la fracción suma. ¿Podría utilizarse una función que
realice la misma operación? }
// No se puede utilizar una funcion porque devuelve más de un resultado.
Program fracciones;
Var
	X,Y,W,Z,Frac1,Frac2:real;
	
Procedure DevolverSuma(A,B,C,D:real);	
Begin	
	Frac1:= D*A + B*C;
	Frac2:= B*D;
	writeln('El numerador es: ' ,Frac1:2:2);
	writeln('El denominador es: ' ,Frac2:2:2);
end;

Begin
	write('Ingrese el primer numerador: ');readln(X);
	write('Ingrese el primer denominador: ');readln(Y);
	writeln;
	write('Ingrese el segundo numerador: ');readln(W);
	write('Ingrese el segundo denominador: ');readln(Z);
	writeln;
	DevolverSuma(X,Y,W,Z);
end.
