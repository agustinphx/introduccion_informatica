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
	N,Dis:byte;
	Cost:real;	

Function CostoEnvio(dis:byte; cost:real):real;
Begin
	Case dis of
		1..4:cost:= 0;
		5..10:cost:= 10;
		11..25:cost:= 15;
		26..100:cost:= 15 + (dis - 25) * 2;
	end;

	If(cost >= 500) then
		cost:= 0;
		
	CostoEnvio:= cost;
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

Procedure LeerArchivo (var N:byte);
Var
	i,CantB:byte;
	Total,Pr:real;
	arch:text;
begin
	Assign(arch,'Delivery.txt');reset(arch);
	readln(arch,N);
	Total:= 0;
	CantB:= 0;
	For i:= 1 to N do
	begin
		readln(arch,Cost,Dis);
		Pr:= CostoEnvio(dis,cost);
		CantB:= CantB + CantidadBonos(dis);
		
		Case CantB of
			1:Cost:= Cost - 10;
			2:Cost:= Cost - 20;
		end;
				
		If(Cost > 500) then
			Pr:= 0;
		
		writeln('El costo por este envio es: $',Pr:2:0,' y obtuvo: ',CantB,' bonos');
		Total:= Total + Cost + Pr ;
	end;
	close(arch);
	writeln;
	writeln('El total facturado es: $',Total:2:0);
	writeln('La cantidad total de bonos son: ',CantB);
end;

Begin
	LeerArchivo(N);
	CostoEnvio(dis,cost);
	CantidadBonos(dis);
end.
