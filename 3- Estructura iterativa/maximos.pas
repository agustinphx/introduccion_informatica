{Desarrollar un algoritmo que muestre de un conjunto de numeros el mayor de todos}
Program maximos;
Var
	Num,Max:integer;
Begin
	Max:= -9999;
	write('Ingrese un numero: ');readln(Num);
	while (num <> 0) do
	begin
		write('Ingrese otro numero: ');readln(Num);
		If (Num > Max) then
			Max:= Num;
	end;
	writeln('El numero maximo es: ',Max);
end.
