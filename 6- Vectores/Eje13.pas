{- Dado un arreglo de enteros, eliminar el máximo elemento, suponer único}
Program eje13;
Type
	TV = array[0..100] of integer;

Procedure LeeVector(Var V:TV; Var N:byte);
Var
	i:byte;
begin
	write('Ingrese la cantidad de numeros del vector: ');readln(N);
	For i:= 1 to N do
	begin
		write('Ingrese un numero para la posicion ',i,' : ');readln(V[i]);
	end;
end;

Function Maximo(V:TV; N:byte):integer;
Var
	i:byte;
	Max:integer;
begin
	Max:= 0;
	For i:= 1 to N do
	begin
		If (V[i] > Max) then
			Max:= V[i];
	end;
	Maximo:= Max;
end;

Procedure Elimina (Var V:TV; Var N:byte);
Var
	i: byte;
	aux:integer;
begin
	For i:= 1 to N- 1 do
	begin
		If (V[i] = Maximo(V,N)) then
		begin
			aux:= V[i];
			V[i]:= V[i + 1];
			V[i + 1]:= aux;
		end;
	end;
	N:= N - 1;
end; 

Procedure Imprime(V:TV; N:byte);
Var
	i:byte;
begin
	writeln('Vector con el maximo elemento eliminado: ');
	For i:= 1 to N do
	begin
		writeln(V[i]);
	end;
end;

Var
	V:TV;
	N:byte;
Begin
	LeeVector(V,N);
	Elimina(V,N);
	writeln;
	Imprime(V,N);
end.
