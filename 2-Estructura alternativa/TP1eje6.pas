{El arancel que cobra una institución universitaria depende de la cantidad de materias que se
cursan.
Por cada una se abonan X pesos, pero si son mas de 3 recibe un descuento del 15%.
La inscripción comienza el día 1, si se anota antes del día 5 tiene un descuento del 5%, si lo hace
después del 25 tiene un recargo de 12%.
Determine los datos que se requieren para calcular el importe a abonar por un alumno}
Program TP1eje6;
Var
	precio:real;
	materias,dia:byte;
Begin
	write('Ingrese el valor de cada materia : ');readln(precio);
	write('Ingrese la cantidad de materias : ');readln(materias);
	If (materias > 3) then
		precio:= precio * materias * 0.85;
	
	write('En que dia se va anotar ? ');readln(dia);
	Case dia of
		1..5: precio:= precio * 0.95;
		25..31: precio:= precio * 1.12;
	end;
	write('El arancel a abonar es : ',precio:2:0);
end.

