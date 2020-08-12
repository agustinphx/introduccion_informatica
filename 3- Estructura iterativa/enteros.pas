{Leer N números enteros, calcular el mínimo de los impares y la cantidad de repeticiones del
mismo.}
Program enteros;
Var
	i,N:word;
	num,min:integer;
Begin
	min:= 0;
	write('Ingrese la cantidad de numeros: ');readln(N);
	For i:= 1 to N do
	begin
		If (num mod 2 <> 0) then
			writeln(num)
		Else
			If (num < min) then
				min:= num;
		write('Ingrese un numero: ');readln(num);
	end;
	writeln('El minimo de los impares es: ',min);
end.
