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
Function Costo(TipoP:char; CantP:byte):real;
Var
	Pr:real;
Begin
	Case TipoP of
		'I':Pr:= CantP * 120;
		'F':Pr:= CantP * 10;
		'A':Pr:= CantP * 15;
	end;
	
	If (Pr > 300) then
		Pr:= Pr * 0.9;
		
	Costo:= Pr;
end;
Var
	CantP,i,N:byte; //Cantidad de plantas
	CantA,CantF,TotalP:word;
	Espacio,TipoP:char; //Tipo de plantas.
	Porc,Acum,Pr:real;
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
				
			Pr:= Costo(TipoP,CantP);
			
			If (TipoP = 'I') then
			begin	
				Acum:= Acum + Pr; //Acumulamos el precio de las plantas de interior para calcular la recaudacion total.
				writeln('a- El cliente debe abonar: $',Pr:2:0,' por la compra de: ',CantP,Espacio,TipoP);
			end
			Else
				If (TipoP = 'F') then
				begin
					CantF:= CantF + CantP;
					writeln('a- El cliente debe abonar: $',Pr:2:0,' por la compra de: ',CantP,Espacio,TipoP);
				end
				Else
				begin
					CantA:= CantA + CantP; //Calcula la cantidad de plantas Aromaticas.
					writeln('a- El cliente debe abonar: $',Pr:2:0,' por la compra de: ',CantP,Espacio,TipoP);
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
