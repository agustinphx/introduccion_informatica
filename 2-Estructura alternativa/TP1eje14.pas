{Un estacionamiento cobra por hora $5 lo vehículos particulares y $6 los comerciales. Si la
estadía se prolonga por mas de 3 horas y hasta 12 se le efectúa un descuento del 5% y por mas
de 12 se cobra una tarifa fija de $35. Si es cliente habitual (esta registrado )
se bonifica el precio final en 10%.
Determine los datos que se requieren para calcular el importe del estacionamiento de un vehículo}
Program TP1eje14;
Var
	horas:byte;
	precio:real;
	vehiculo,registro:char;
Begin
	write('Cuantas horas estaciono? : ');readln(horas);
	write('Su vehiculo es: P- Particular / C- Comercial : ');readln(vehiculo);
	write('El cliente esta registrado? : S / N : ');readln(registro);
	
	If (vehiculo = 'P') then
		precio:= horas * 5
	Else if (vehiculo = 'C') then
		precio:= horas * 6;
		
	Case horas of
		3..12: precio:= precio * 0.95;
		13..100: precio:= precio + 35;
	end;
	
	if (registro = 'S') then
		precio:= precio * 0.9;
		
	writeln(' ');		
	writeln('El precio a abonar por su vehiculo es : ',precio:2:0);
end.




	
