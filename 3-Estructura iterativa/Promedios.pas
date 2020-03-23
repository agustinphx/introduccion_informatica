{Leer un conjunto de N números enteros (distintos de cero),
calcular el promedio de positivos y negativos}
Program Promedios;
Var
	ContP,ContN,SumP,N,i:word;
	num,SumN:integer;
Begin
	ContP:= 0;
	ContN:= 0;
	SumP:= 0;
	SumN:= 0;
	write('Ingrese la cantidad de numeros: ');readln(N); // Ingresamos una cantidad N y la leemos para utilizarla  en el ciclo For.
	For i:= 1 to N do
	begin
		writeln('Ingrese un numero: ');readln(num);
		If (num > 0) then
		begin
			ContP:= ContP + 1; // Cuenta cada numero positivo que se ingresa.
			SumP:= SumP + num; // Suma el 0 de la variable SumP + el numero positivo que se ingrese en el ciclo.
		end
		Else
		Begin
			ContN:= ContN + 1; // Cuenta cada numero negativo que se ingresa.
			SumN:= SumN + num; // Suma el 0 de la variable SumN + el numero negativo que se ingrese en el ciclo.
		end
	end;
	
	If (ContP <> 0) then
		writeln('El promedio de positivos es: ',SumP div ContP) // Dividimos la cantidad de numeros positivos ingresados.
	Else
		writeln('No ingresaron numeros positivos');
	
	If (ContN <> 0) then
		writeln('El promedio de negativos es: ',SumN div ContN) // Dividimos la cantidad de numeros negativos ingresados.
	Else
		writeln('No ingresaron numeros negativos');	
end.



