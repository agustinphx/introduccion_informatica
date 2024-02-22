{Un supermercado premia con descuentos las compras efectuadas por sus clientes.
Si alcanza los $100 descuenta $3 y sobre el excedente que no alcanza a $100 se aplica el siguiente
descuento:
Hasta $20 el 1.5 %
Mas de $20 y hasta $50 el 2%
Mas de $50 y menos de $100 el 2.5%
Si la compra supera los $500 una vez realizados los descuentos, recibe un 1% adicional
Determine los datos que se requieren para calcular el importe final de una compra y m uestre su excedente}
Program TP1eje11;
Var
	precio,excedente:real;
Begin
	write('Ingrese el monto de la compra ? : ');readln(precio);
	If (precio = 100) then // Descuento de $3 por alcanzar los $100 en una compra.	
		precio:= precio - 3
	Else
		if (precio < 100) then 
			excedente:= 100 - precio // Excedente que no alcanza los 100 se aplican los descuentos
		Else
			If (precio > 500) then // Descuento del 1% por superar los $500 en una compra.
				precio:= precio * 0.99;
			
	If (excedente >= 1) and (excedente <= 20) then
		precio:= precio * 0.985 // Descuento del 1.5%
	Else 
		if (excedente >  20) and (excedente <= 50) then
			precio:= precio * 0.98 // Descuento del 2%
		Else
			if (excedente > 50) and (excedente < 100) then
				precio:= precio * 0.975; // Descuento del 2.5%}
				
	writeln(' ');			
	writeln('El precio final con descuento es: $',precio:2:0);
	writeln(' ');
	write('El excedente es: $',excedente:2:0);

end.
		
	
