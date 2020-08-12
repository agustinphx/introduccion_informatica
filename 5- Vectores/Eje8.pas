{Verificar si todos los elementos de un arreglo de N enteros son pares}
Program eje8;
Type
	TV = array[1..100] of  integer;

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

Procedure Verifica(V:TV; N:byte);
Var
	i,Cont:byte;
begin
	Cont:= 0;
	For i:= 1 to N do
	begin
		If (V[i] MOD 2 = 0)then
			Cont:= Cont + 1;
	end;
	If (Cont = N) then
		writeln('Todos los elementos son pares')
	Else
		writeln('No todos los elementos son pares');
end;

Var
	V:TV;
	N:byte;
Begin
	LeeVector(V,N);
	Verifica(V,N);
end.
