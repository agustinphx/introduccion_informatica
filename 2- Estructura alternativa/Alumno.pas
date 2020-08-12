// Crear un algoritmo, basado en la nota
//Imprima si el alumno aprueba
// Aprueba con 6, si se saca 9 o mas es un alumno sobresaliente, si se saca  menos de 6 debe recursar.
Program Alumno;
Var
	nota:byte;
Begin
	write('ingrese la nota del final: '); readln(nota);
	If ( nota >= 6) then
		write('el alumno esta aprobado')
	Else
		write('el alumno esta desaprobado');
		
	If (nota >= 9) then
		write(',es un alumno sobresaliente')
	Else
		writeln(', el alumno debe recursar');

end.
	

