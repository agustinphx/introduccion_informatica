{Ingresar un conjunto de números ordenados almacenando en un arreglo los números sin
repetición}
Program eje14;
Type
	TV = array[1..100] of integer;

Procedure LeeVector(Var V:TV; Var N:byte);
Var
	i:byte;
begin
	write('Ingrese la cantidad de elementos del vector: ');readln(N);
	For i:= 1 to N do
	begin
		write('Ingrese un numero: ');readln(V[i]);
	end;
end;

Procedure SinRepeticion(V:TV; N:byte; Var Vrepe:TV; Var M:byte);
Var
	i:byte;
begin
	M:= 0;
	For i:= 1 to N  do
	begin
		If (V[i] <> V[i + 1]) then
		begin
			M:= M + 1;
			Vrepe[M]:= V[i];
		end;
	end;
end;

Procedure Imprime(Vrepe:TV; M:byte);
Var
	i:byte;
begin
	writeln('Vector  sin numeros repetidos');
	For i:= 1 to M do
	begin
		writeln(Vrepe[i]);
	end;
end;

Var
	V,Vrepe:TV;
	N,M:byte;
Begin
	LeeVector(V,N);
	SinRepeticion(V,N,Vrepe,M);
	writeln;
	Imprime(Vrepe,M);
end.
