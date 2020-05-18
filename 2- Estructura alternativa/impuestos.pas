//Desarrollar un programa para aplicar un ajuste anual por pago atrasado de impuestos inmobiliarios a un contribuyente.
//El incremento depende del año que paga. Si el año es anterior a 1980, se venció la
//obligación y no adeuda importe alguno, en otros casos:
//- 1980 a 1990 Se aplica un recargo del 200% .
//- 1991 a 1999 Se aplica un recargo del 100%.
//- 2000 a 2009 Se aplica un recargo del 70%.
//- 2010 a 2015 Se aplica un recargo del 30 %.
Program impuestos;
Var
	anio:longint;
	deuda:real;
Begin
	write('Ingrese el anio de su deuda : ');readln(anio);
	write('Ingrese el monto de su deuda : ');readln(deuda);

	If (anio < 1980) then
		deuda:= 0
	Else 
		if (anio <= 1990) then
			deuda:= deuda * 2
		Else 
			if (anio <= 1999) then
				deuda:= deuda + deuda
			Else 
				if (anio <= 2009) then
					deuda:= deuda * 1.7
				Else
					deuda:= deuda * 1.3;
		
	writeln('Su deuda es : ',deuda:2:0);
end.
