//Un mayorista vende docenas de huevos y los cobra de la siguiente forma: 
// $6 la primera docena, $5 a partir de la segunda docena  y $4 el maple que contiene 30 huevos.
//Dada una cantidad X calcular el precio correspondiente. Probar con las siguientes cantidades: 24- 12 - 60 - 30
Program mayorista;
Var
	cantidad:byte;
	precio:real;
Begin
	write('Ingrese la cantidad de huevos: ');readln(cantidad);

	If(cantidad = 12) then
		precio:= cantidad * 6
	Else 
		if (cantidad < 30) then
			precio:= cantidad * 5
		Else
			precio:= cantidad * 4;
	writeln('El precio a pagar es: ',precio:2:0);
end.
