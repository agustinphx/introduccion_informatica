{Un mayorista vende huevos y los cobra de la siguiente forma:
$5 la primera docena,
del sobrante $3 cada 10 unidades,
de lo que sobra $2 cada 5 unidades y luego $1 por unidad}
Program mayorista;
Var
	cantidad,sobrante:byte;
	precio:real;
Begin	

	write('Ingrese la cantidad de huevos: ');readln(cantidad);
	If(cantidad >= 12 ) then
	begin
		precio:= 5;
		sobrante:= cantidad - 12;
	end
	Else
		sobrante:= 12 - cantidad;
		
	If (sobrante MOD 10 >= 0) then
		precio:= precio + (cantidad DIV 10)*3
	Else
		if (sobrante MOD 5 >= 0) then
			precio:= precio + (cantidad DIV 5)*2
		Else
			precio:= precio;

	writeln('El sobrante es: ',sobrante); //Añadi esta linea para testear si contaba bien la cantidad sobrante.
	writeln('El precio es: $',precio:2:0);
	
end.
