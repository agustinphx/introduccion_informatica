Program test1;
Const
Dolar = 60.19;
Euro = 63.48;
Var
	D,E:char;
	letter:char;
	price:real;
Begin	
price:= 0;
writeln('Elija la moneda a convertir  D =Dolar o  E= Euro');readln(letter);

	While (letter = D) do
		begin
		writeln('ingrese el valor en dolares');readln(price);
		writeln(' el precio en pesos es :', price * Dolar:4:2);
		end;
		
	While ( letter = E) do
		begin
		writeln('ingrese el valor en euros');readln(price);
		writeln(' el precio en pesos es :', price * Euro:4:2);
		end;
end.
