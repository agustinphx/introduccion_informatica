{-Almacenar en un arreglo M números enteros. Se pide poner en 0 los lugares ocupados por valores iguales al
máximo, salvo el primero de ellos. Mostrar por pantalla el conjunto original y el modificado. Además indicar la
cantidad de reemplazos efectuados.
Ejemplo:
números : 3 4 8 1 24 3 1 24 15 24
números modificados : 3 4 8 1 24 3 1 0 15 0 , reemplazos = 2 }
Program Ad1;
Type
	TV = array[1..100] of integer;

Procedure LeeVector(Var V:TV; Var M:byte);
Var
	i:byte;
begin
	write('Ingrese la cantidad de numeros del vector: ');readln(M);
	For i:= 1 to M do
	begin
		write('Ingrese un numero: ');readln(V[i]);
	end;
end;

Function Maximo(V:TV; M:byte):integer;
Var
	i:byte;
	Max:integer;
begin
	Max:= 0;
	For i:= 1 to M do
	begin
		If (V[i] > Max) then
			Max:= V[i];
	end;
	Maximo:= Max;
end;

Procedure Modifica(V:TV; M:byte; Var Vmod:TV; Var N:byte);
Var
	i,Cont,ContR:byte;
	Max:integer;
begin
	N:= 0;
	Cont:= 0;
	ContR:= 0;
	Max:= Maximo(V,M);
	For i:= 1 to M do
	begin
		N:= N + 1;
		Vmod[N]:= V[i];
		
		If (V[i] = Max) then
			Cont:= Cont + 1;
			
		If (V[i] = Max) and (Cont > 1) then
		begin
			Vmod[N]:= 0;
			ContR:= ContR + 1;
		end;
	end;
	writeln;
	writeln('Cantidad de reemplazos: ',ContR);
end;

Procedure Imprime(V,Vmod:TV; N,M:byte);
Var
	i:byte;
begin
	writeln('Vector original');
	For i:= 1 to M do
	begin
		write(V[i]:4);
	end;
	writeln;
	writeln;
	writeln('Vector modificado');
	For i:= 1 to N do
	begin
		write(Vmod[i]:4);
	end;

end;

Var
	V,Vmod:TV;
	N,M:byte;
Begin
	LeeVector(V,M);
	Modifica(V,M,Vmod,N);
	writeln;
	Imprime(V,Vmod,N,M);
end.
