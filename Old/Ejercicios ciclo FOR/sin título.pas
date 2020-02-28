// Crear un algoritmo, basado en la nota
//Imprima si el alumno aprueba
// Aprueba con 6


Program courseUdemy;
Var
	nota:byte;
	
Begin
	writeln('ingrese la nota'); readln(nota);
	begin
		if ( nota >= 6) then
		write('el alumno esta aprobado')
		else
		writeln('el alumno esta desaprobado');
	end
	If (nota >= 9) then
	begin
		write(' es un prodigio')
	else (nota < 2) 
		write(' es un desastre');
	end;

end.
	
