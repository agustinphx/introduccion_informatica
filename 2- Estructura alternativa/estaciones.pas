//Ingresar una fecha ( dia y mes) informar a qué estación pertenece.
Program estaciones;
Var
	mes,dia:byte;
Begin
	write('Ingrese el dia : ');readln(dia);
	write('Ingrese el mes : ');readln(mes);

	If(mes = 12) and (dia >= 21) or (mes <= 3) and (dia < 21) then
		writeln('Es verano')
	Else
		If(mes = 3) and (mes < 6) and (dia >= 21) or (mes > 3) and (mes <= 6) and (dia < 21) then
			writeln('Es otonio')
		Else
			If(mes = 6) and (dia >= 20) or (mes > 6) and (mes <= 7) and (dia < 21) then
				writeln('Es invierno')
			Else
				writeln('Es primavera');
end.
