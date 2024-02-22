//Desarrollar un programa para aplicar un ajuste anual por pago atrasado de impuestos inmobiliarios a un contribuyente.
//El incremento depende del año que paga. Si el año es anterior a 1980, se venció la
//obligación y no adeuda importe alguno, en otros casos:
//- 1980 a 1990 Se aplica un recargo del 200% .
//- 1991 a 1999 Se aplica un recargo del 100%.
//- 2000 a 2009 Se aplica un recargo del 70%.
//- 2010 a 2015 Se aplica un recargo del 30 %.
//Implementar la solución utilizando la sentencia CASE.
Program impuestos;
Var
	anio:longint;
	deuda:real;
Begin
	write('Ingrese el anio de su deuda : ');readln(anio);
	write('Ingrese el monto de su deuda : ');readln(deuda);
	
	Case anio of
		1..1979: deuda:= deuda * 0;
		1980..1990: deuda:= deuda + deuda *2;
		1991..1999: deuda:= deuda + deuda;
		2000..2009: deuda:= deuda * 1.7;
		2010..2015: deuda:= deuda * 1.3;
	end;
	write('Su deuda es : ',deuda:2:0);
end.
