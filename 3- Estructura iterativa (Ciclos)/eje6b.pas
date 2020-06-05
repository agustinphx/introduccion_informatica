{Dado un conjunto de números enteros distintos de cero, informar el porcentaje de pares e
impares, utilizando el ciclo While..}
Program eje6b;
Var
	num:integer;
	ContP,ContI,ContTotal:word;
	porcP,porcI:real;
Begin
	ContP:= 0;
	ContI:= 0;
	ContTotal:= 0;
	write('Ingrese un numero: ');readln(num);
	
	While (num <> 0) do
	begin
		write('Ingrese otro numero: ');readln(num);
		If (num mod 2 = 0) then
			ContP:= ContP + 1
		Else
			ContI:= ContI + 1;	
	end;
	
	ContTotal:= ContP + ContI; // Sume ambas variables para sacar más fácil los %. Con un For hubiera sido más simple.
	porcP:= (ContP / ContTotal) * 100;
	porcI:= (ContI / ContTotal) * 100;
	writeln('El porcentaje de pares son: ',porcP:2:0,' %');
	writeln('El porcentaje de impares son: ',porcI:2:0,' %');

	
end.
			
