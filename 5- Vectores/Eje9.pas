{ Verificar si un arreglo de reales esta ordenado ascendentemente o descendente. }
Program eje9;
Type
	TV = array[1..100] of real;

Procedure LeeVector(Var V:TV; Var N:byte; Var Num:real);
Var
	i:byte;
begin
	write('Ingrese la cantidad de numeros del vector: ');readln(N);
	For i:= 1 to N do
	begin
		write('Ingrese un numero: ');readln(Num);
		V[i]:= Num;
	end;

end;

Procedure Verifica(V:TV; N:byte; Num:real);
Var
	i:byte;
begin
	i:= 0;
	while (i <= N) and (V[i] < Num) do
		i:= i + 1;
	
	If (i = N) then
		writeln('El vector esta ordenado en forma ascendente')
	Else
		writeln('El vector esta en forma descendente');
end;
Var
	V:TV;
	N:byte;
	Num:real;
Begin
	LeeVector(V,N,Num);
	Verifica(V,N,Num);
end.
