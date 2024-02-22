{Una empresa fumigadora, cobra a los productores distintos aranceles según el tipo de
fumigación y la cantidad de hectáreas.
Tipo 1 y 2 : 20 $/ha.
Tipo 3 : 30 $/ha.
Tipo 4 : 40 $/ha.
Además:
Si el área a fumigar es mayor que 100 has. se aplica un 5% de descuento.
Si el importe total supera los $1.500 se aplica un 10% de descuento, sobre la cantidad
que excede los $ 1.500. Desarrollar un algoritmo que lea las triplas:
NOMBRE, TIPO (1-4) , CANTIDAD (has.)
y calcule e imprima los datos leídos y el costo del trabajo.}
Program fumigadora;
Var
	i,N,Cant:word;
	Nom:string;
	Tipo:char;
	Precio,Dto:real;
Begin
	Cant:= 0;
	write('Cuantos productores son? : ');readln(N);
	For i := 1 to N do
	begin
		write('Ingrese el nombre: ');readln(Nom);
		write('Ingrese el tipo de fumigacion: 1 / 2 / 3 / 4 : ');readln(Tipo);
		write('Ingrese la cantidad de hectareas: ');readln(Cant);
		
		If (Tipo = '1') or (Tipo = '2') then
			Precio:= Cant * 20
		Else
			if (Tipo = '3') then
				Precio:= Cant * 30
			Else
				Precio:= Cant * 40;
				
		If (Cant > 100) then
			Precio:= Precio * 0.95;
			
		If (Precio > 1500) then
			Dto:= (Precio - 1500) * 0.10;
			
		Precio:= Precio - Dto;
		writeln('El costo del trabajo para ',Nom,' es: $',Precio:2:2);
		writeln(' ');
	end;	
end.
