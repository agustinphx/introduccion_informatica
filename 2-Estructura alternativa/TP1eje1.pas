// En un concurso de salto hípico los jinetes saltan con su caballo, registrándose:
// Altura
// Distancia
//Se determina la siguiente clasificación:
//Bueno el salto donde la altura y la distancia superan los 2.5 mt (ambas).
//Normal el salto donde altura o distancia superen los 2.5 mt.
//Malo cualquier otra marca
//Determine los datos que se requieren para clasificar un salto y deben ingresarse al proceso.
Program TP1eje1;
Var
	altura,distancia:real;
Begin
	write('Ingrese la altura de su salto en metros : ');readln(altura);
	write('Ingrese la distancia de su salto en metros: ');readln(distancia);
	
	If (altura > 2.5) and (distancia > 2.5) then
		write('El salto es : Bueno')
	
	Else if (altura > 2.5) or (distancia > 2.5) then
		write('El salto es : Normal')
	
	Else if (altura < 2.5) or (distancia < 2.5) then
		write('El salto es : Malo');
end.
