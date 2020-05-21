{Ingresar K números que representan montos de ventas de una empresa, ordenados en forma
ascendente.
Calcular y mostrar por pantalla el promedio de los mismos y el % de participación de cada uno
respecto de la suma total en forma descendente.}
Program montos;
Type
	TV = array[1..100] of real;
Var
	Vec:TV;
	
Function Suma(Vec:TV; K:byte):real;
Var
	i:byte;
	aux:real;
begin
	aux:= 0;
	For i:= 1 to K do
		aux:= aux + Vec[i];
	Suma:= aux;
end;
	
Function Promedio(Vec:TV; K:byte):real;
begin
	Promedio:= Suma(Vec,K) / K;
end;

Procedure MuestraDescendente(Vec:TV; K:byte);
Var
	i:byte;
begin
	For i:= K downto 1 do
		writeln('$',Vec[i]:2:2);
end;

Procedure IngresaMontos(Var Vec:TV);
Var
	i,K:byte;
	Porc:real;
begin
	write('Ingrese la cantidad de ventas: ');readln(K);											
	For i:= 1 to K do
	begin
		writeln;
		write('Ingrese el monto de la venta: ');readln(Vec[i]);
		Suma(Vec,K);
		Promedio(Vec,K);
		Porc:= (Vec[i] / Suma(Vec,K)) * 100;
		writeln('El porcentaje de participacion de: ',Vec[i]:2:0,' es: ',Porc:2:0,' %');
	end;
	writeln;
	writeln('El promedio es de: $',Promedio(Vec,K):2:2);
	writeln;
	writeln('Montos en forma descendente');
	MuestraDescendente(Vec,K);
end;

Begin
	IngresaMontos(Vec);
end.
