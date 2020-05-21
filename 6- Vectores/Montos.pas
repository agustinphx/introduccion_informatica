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

Procedure IngresaMontos(Var Vec:TV);
Var
	i,K:byte;
begin
	write('Ingrese la cantidad de ventas: ');readln(K);											
	For i:= 1 to K do
	begin
		write('Ingrese el monto de la venta: ');readln(Vec[i]);
		Suma(Vec,K);
		Promedio(Vec,K);
	end;
	writeln;
	writeln('El promedio es de: $',Promedio(Vec,K):2:2);
	
end;

Begin
	IngresaMontos(Vec);
end.


{Function Porcentaje(Vec:TV; K:byte):real;
Var
	i:byte;
	Porc:real;
begin
	For i:= 1 to K do
		Porc:= Suma(Vec,K) / K * 100;
	Porcentaje:= Porc;
end;
* 
* 
* Porcentaje(Vec,K);
* writeln('El porcentaje de participacion de ',Vec[i]:2:0,' es: ',Porcentaje(Vec,K):2:0,' %');}
