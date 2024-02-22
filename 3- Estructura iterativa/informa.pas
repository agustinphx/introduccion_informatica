{-Leer un número, calcular e informar la suma de los números naturales hasta ese número.}
Program informa;
Var
	i,N,ContNa,SumNa:word; 
	num:integer;
Begin
	ContNa:= 0;
	SumNa:= 0;
	write('Ingrese la cantidad de numeros: ');readln(N);
	For i := 1 to N do
	begin
		write('Ingrese un numero: ');readln(num);
		If (num > 0) then
		begin
			ContNa:= ContNa + 1;
			SumNa:= SumNa + num;
		end;
	end;
	writeln(' ');
	writeln('La suma de los naturales es: ',SumNa);
end.
