{En un archivo Ventas.TXT un Vivero registra las compras de N clientes que
llevaron las plantas en oferta, clasificadas como: plantas de interior (I),
plantines de flores (F) y plantines de hierbas aromáticas (A).
Los precios son:
Las plantas de interior cuestan $120 cada una,
los plantines de flores se cobran $10 cada uno y
los plantines aromáticos cuestan $15 cada uno.
Si la compra excede los $300 se hace un descuento del 10%.
Cada cliente compra un solo tipo de planta/plantín.
Se pide: Ingresar para cada cliente, cantidad y tipo de
planta/plantín comprado y además calcular e informar:
a. Cuánto debe abonar cada cliente
b. Cuánto se recaudó al final del día por compras de clientes que compraron plantas de interior.
c. Porcentaje de plantines aromáticos vendidas sobre el total de plantines vendidos.}
Program TPCiclos;
Var
	CantP,i,N:byte; //Cantidad de plantas
	CantA,CantF,TotalP:word;
	Espacio,TipoP:char; //Tipo de plantas.
	Precio,Porc,Acum:real;
	Arch:text;
begin
	Assign(Arch,'Ventas.txt');reset(Arch);
	readln(Arch,N);
	while not eof (Arch) do
	begin
		Acum:= 0;
		CantA:= 0; 
		CantF:= 0;
		TotalP:= 0;
		For i := 1 to N do
		begin
			If (i <> N ) then
				read(Arch,CantP,Espacio,TipoP)
			Else
				readln(Arch,CantP,Espacio,TipoP);
					
			If (TipoP = 'I') then
			begin	
				Precio:= CantP * 120;
				Acum:= Acum + Precio; //Acumulamos el precio de las plantas de interior para calcular la recaudacion total.
				writeln('a- El cliente debe abonar: $',Precio:2:0,' por la compra de: ',CantP,Espacio,TipoP);
			end
			Else
				If (TipoP = 'F') then
				begin
					Precio:= CantP * 10;
					CantF:= CantF + CantP;
					writeln('a- El cliente debe abonar: $',Precio:2:0,' por la compra de: ',CantP,Espacio,TipoP);
				end
				Else
				begin
					Precio:= CantP * 15;
					CantA:= CantA + CantP; //Calcula la cantidad de plantas Aromaticas.
					writeln('a- El cliente debe abonar: $',Precio:2:0,' por la compra de: ',CantP,Espacio,TipoP);
				end;
				
				If (Precio > 300) then //Descuento por exceder los $300 en una compra.
				begin	
					Precio:= Precio * 0.9;
					writeln('   Pero obtiene descuento y el nuevo monto es: $',Precio:2:0);
				end;
			TotalP:= CantF + CantA;	//Calcula el total de plantines.		
			writeln;
			Porc:= (CantA / TotalP) * 100; //Porcentaje de plantines aromaticos vendidos sobre el total de plantines.
		end;	
	end;
	close(Arch);
	writeln('b- Recaudacion total por venta de plantas de interior: $',Acum:2:0);
	writeln('c- Platines aromaticos vendidos: ',Porc:2:2,'% del total vendido');
end.
