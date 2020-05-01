{Leer M números y para cada uno calcular e informar el factorial mediante una función
entera. }
Program Factorial;

Function Factorial(n:integer):integer;
begin
	if (n = 0) then
		Factorial:= 1
	Else
		Factorial:= n *(n - 1);
end;

Var
	i,M:word;
	Num:integer;
Begin
	write('Ingrese la cantidad de numeros: ');readln(M);
	For i:= 1 to M do
	begin
		write('n  = ');readln(Num); //De aca lee Num y va para la funcion como parametro n y de ahi verifica las condiciones.
		writeln(Num,'! = ',Factorial(Num));
		writeln('------');
	end;
end.
