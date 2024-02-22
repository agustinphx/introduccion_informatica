{Desarrollar un algoritmo que calcule la raiz cuadrada de un numero introducido, hasta que este sea negativo}
Program raiz;
Var
	cuad:real;
	X:integer;
	
Begin
	write('Ingrese un numero: ');readln(X);
	
	While (X >= 0) do
	begin	
		cuad:= sqrt(X);
		writeln('La raiz cuadrada es: ',cuad:2:0);readln(X) // Si no pongo el readln(X) se produce un ciclo infinito.
	end;
	writeln('No se puede hallar la raiz de un numero negativo');
end.
