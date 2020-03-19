// Crear un algoritmo, basado en la nota
//Imprima si el alumno aprueba
// Aprueba con 6
Program Alumno;
Var
	nota:byte;
Begin
	writeln('ingrese la nota del final'); readln(nota);
	begin
	if ( nota >= 4) then
		write('el alumno esta aprobado')
	Else
		write('el alumno esta desaprobado');
	end;
	Begin 
	If (nota >= 9) then
		write(',es un alumno sobresaliente')
	end;
	Begin
	If ( nota <= 3 ) then 
		writeln(', el alumno debe recursar');
	end;

end.
	

