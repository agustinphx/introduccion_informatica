// Probando funciones

Program funciones;

Var
	a,b:real;
	
Function Suma( Var a,b):real;
	Suma := a + b;

Function Imprimir( Var a,b):real;
	write(Suma);

Begin
	writeln('ingrese un numero para sumar :'); readln(a);
	writeln('ingrese otro numero :'); readln(b);
	Suma(a,b);
	Imprimir(a,b);
	
end.
