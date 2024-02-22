{A partir de las notas obtenidas en dos parciales, se determina la situación del alumno en la
materia : PROMOVIDO, HABILITADO o DESAPROBADO.
Los parciales se aprueban con 4 o mas.
-Promueve el alumno que habiendo aprobado los dos parciales, obtuvo con ambos una suma de
14 y en el segundo puntaje superior a 6.
-Habilita el alumno que aprobó al menos un parcial con suma total mayor o igual 10, debe rendir
final.
-Desaprueba el alumno que no cumple ninguna de las condiciones anteriores.
Determine los datos que se requieren para establecer la condición de un alumno}
Program TP1eje7;
Var
	parcialUno,parcialDos,suma:byte;
Begin
	write('Ingrese la nota del primer parcial : ');readln(parcialUno);
	write('Ingrese la nota del segundo parcial : ');readln(parcialDos);
	suma:= parcialUno + parcialDos;
	
	If (parcialUno >= 4) and (parcialDos > 6) and (suma >= 14)then
		write('El alumno esta promovido')
	Else
		if (suma >= 10) then
			write('El alumno esta habilitado')
		Else 
			write('El alumno esta desaprobado');
end.

