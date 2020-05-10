{2.- Un delivery cobra los envíos por montos menores a $500 de la siguiente forma:
 Menos de 5 cuadras  gratis
 Hasta 10 cuadras  $10
 Más de 10 cuadras y hasta 25  $15
 Por cuadra extra después de 25  $2
Si el monto de la compra fue mayor a $300 tiene una bonificación del 5% sobre dicho importe.
2.a) Se pide ingresar un conjunto de pares de datos:
- Monto de compra
- Distancia en cuadras
2.b) Además se obtiene un bono de $10 para el siguiente delivery por cada $200 que compre
siempre que no esté exento de envío.
Calcular e informar el costo de cada envío, el total facturado (incluye envío) y la cantidad total de
Bonos otorgados.}
Program delivery;
Var
	Dis,N,Cant:byte;
	Espacio:char;
	CostE,Cost,Total:real;	

Function CostoEnvio(dis:byte; cost:real):real;
Begin
	Case dis of
		1..4:cost:=0;
		5..10:cost:=10;
		11..25:cost:=15;
	end;
	
	If (Dis > 25) then
		cost:= 15 + (Dis - 25) * 2;

	CostoEnvio:= cost;
	writeln('El costo de envio es: $',cost:2:0);
end;

Function CantidadBonos(dis:byte):byte;
Var
	CantB:byte;
begin
	CantB:= 0;
	
	If (dis > 5) and (cost / 200 = 1) then
		CantB:= 1
	Else
		if (dis > 5) and (cost / 200 = 2) then
			CantB:= 2;

	CantidadBonos:= CantB;
end; 

Procedure LeerArchivo (var N,CantB:byte;  var CostE,Total:real);
Var
	i:byte;
	arch:text;
begin
	Assign(arch,'Delivery.txt');reset(arch);
	readln(arch,N);
	Total:= 0;
	while not eof (arch) do
	begin
		For i:= 1 to N do
		begin
			if (i <> N) then
				read(arch,Cost,Espacio,Dis)
			Else
				readln(arch,Cost,Espacio,Dis);
				
			writeln(Cost:2:0);
			CostE:= CostoEnvio(Dis,Cost);
			Total:= Total + Cost + CostE;
			CantB:= CantidadBonos(Dis);
		end;
	end;
	close(arch);
	writeln('El costo total es: ',Total:2:0);
	writeln('La cantidad de bonos son: ',CantB);
end;



Begin
	LeerArchivo(N,Cant,CostE,Cost);
 	CantidadBonos(Dis);
end.
