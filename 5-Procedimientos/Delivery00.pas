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
	Dis,N:byte;
	Espacio:char;
	Monto,Total:real;	
	
Procedure LeerArchivo(var N:byte);
Var
	i:byte;
	arch:text;
begin
	Assign(arch,'Delivery.txt');reset(arch);
	readln(arch,N);
	while not eof (arch) do
	begin
		For i:= 1 to N do
			readln(arch,Monto,Espacio,Dis);	
	end;
	close(arch);
end;

Procedure Calcula (dis:byte; cost:real; var total:real; var N:byte); 
Var
	CantB,i:byte;
	costE:real;
	
begin
	CantB:= 0;
	For i:= 1 to N do
	begin
			If (dis > 5) and (cost / 200 = 1) then
				CantB:= CantB + 1
			Else
				if (dis > 5) and (cost / 200 = 2) then
					CantB:= CantB + 1 ;
			
			If (dis < 5) then
				costE:= 0
			Else
				if (dis <= 10) then
					costE:= 10
				Else
					if (dis <= 25) then
						costE:= 15;
			
			If (Dis > 25) then
				costE:= 15 + (Dis - 25) * 2;
			
			total:= total + Monto + costE;
	
			writeln('El costo del envio ',i,' fue: $',costE:2:0);
		end;
	writeln;
	writeln('El total facturado es: $',total:2:0);
	writeln('La cantidad de bonos es: ',CantB);
end;

{Function CostoEnvio(dis:byte; cost:real):real;
Begin
	LeerArchivo(N);
	If (dis < 5) then
		cost:= 0
	Else
		if (dis <= 10) then
			cost:= 10
		Else
			if (dis <= 25) then
				cost:= 15;
	
	If (Dis > 25) then
		cost:= 15 + (Dis - 25) * 2;

	CostoEnvio:= cost;
end;

Function CantidadBonos(dis:byte; cost:real; N:byte):real;
Var
	CantB,i:byte;
begin
	For i:= 1 to N do
	begin
		If (dis > 5) and (cost / 200 = 1) then
			CantB:= 1
		Else
			if (dis > 5) and (cost / 200 = 2) then
				CantB:= 2;
	end;	
	CantidadBonos:= CantB;
end; }

Begin
	LeerArchivo(N);
	Calcula(Dis,Monto,Total,N);
end.
