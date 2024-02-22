{ Idem 10 pero suponer que los números están ordenados en forma ascendente. ¿debe recorrer
siempre el arreglo hasta el final?}
Program Eje11;
Type
	TV = array[1..100] of real;
	
Procedure LeeVector(Var V:TV; Var N:byte);
Var
	i:byte;
begin
	write('Ingrese la cantidad de numeros: ');readln(N);
	For i:= 1 to N do
	begin
		write('Ingrese un numero: ');readln(V[i]);
	end;
end;

Function Busca(V:TV; N:byte; X:real):real;
Var
	i:byte;
begin
	i:= 1;
	while (i <= N) and (V[i] <> X) do
		i:= i + 1;
		
	If (i <= N) then
		Busca:= i
	Else
		Busca:= 0;
end;

Procedure Imprime(V:TV; N:byte; X:real);
begin
	writeln('El numero buscado esta en la posicion: ',Busca(V,N,X):2:0);
end;

Var
	V:TV;
	N:byte;
	X:real;
Begin
	write('Ingrese un numero: ');readln(X);
	writeln;
	LeeVector(V,N);
	writeln;
	Imprime(V,N,X);
end.
