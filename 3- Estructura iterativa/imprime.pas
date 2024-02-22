{Leer un conjunto de N números enteros (distintos de cero),
Mostrar los impares y además contar e informar cuantos son pares.}
Program ImprimeEnteros;
Var
	i,N,ContP:word;
	num:integer;
Begin
	ContP:= 0;
	write('Ingrese la cantidad de numeros: ');readln(N);
	For i:= 1 to N do
	begin
		write('Ingrese un numero: ');readln(num);
		If(num mod 2 <> 0) then // Si es distinto de 0 muestra los impares, sino cuenta los pares.
		begin
			writeln(num);
			writeln(' ');
		end
		Else
			ContP:= ContP + 1;
	end;
	writeln(' ');
	writeln('La cantidad de pares es: ',ContP);
	
end.
