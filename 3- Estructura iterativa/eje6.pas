{Dado un conjunto de números enteros distintos de cero, informar el porcentaje de pares e
impares..}
Program eje6;
Var
	i,N:word;
	num,ContP,ContI:integer;
	porcP,porcI:real;
Begin
	ContP:= 0;
	ContI:= 0;

	Write('La cantidad de enteros que desea evaluar: ');readln(N);
	For i:= 1 to N do
	begin
		write('Ingrese un numero: ');readln(num);
		If (num mod 2 = 0) then
			ContP:= ContP + 1
		Else
			ContI:= ContI + 1;
	end;
	porcP:= (ContP / N) * 100 ;
	porcI:= (ContI / N) * 100;
	writeln('El porcentaje de pares es: ',porcP:2:0,' %');
	writeln('El porcentaje de impares es: ',porcI:2:0,' %');
end.
