{Leer N números enteros, calcular el mínimo de los impares y la cantidad de repeticiones del
mismo.}
Program enteros;
Var
	Num:integer;
	i,N,Cont,Min:word;
Begin
	Cont:= 0; 
	Min:= 999; //Valor random para calcular el minimo.
	write('Ingrese la cantidad de numeros: ');readln(N);
	For i:= 1 to N do
	begin	
		write('Ingrese un numero: ');readln(Num);
		
		If (Num < Min) and (Num MOD 2 <> 0) then //Calcula el minimo de los impares ingresados.
			Min:= Num;
		
		If (Num MOD 2 <> 0) then //Cuenta la cantidad de impares.
			Cont:= Cont + 1;
	end;
	writeln('La cantidad de impares es: ',Cont);
	writeln('El minimo de los impares es: ',Min);
end.

	
