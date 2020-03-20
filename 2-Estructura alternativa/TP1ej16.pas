{Una empresa de transportes realiza envíos de cargas, se desea calcular y mostrar el importe
a pagar.
Los datos que se ingresan son PESO de la carga (número real) y CATEGORIA (dato codificado:
1 -común, 2 - especial, 3 – aéreo).
El precio se calcula a $2 por Kg para categoría común, $2.5 por Kg para categoría especial y $3
por Kg para categoría aérea.
Se cobra recargo por sobrepeso: 30% si sobrepasa los 15 Kg, 20% si pesa más de 10 Kg y hasta
15Kg inclusive, 10% más de 5Kg y hasta 10 Kg inclusive.}
Program TP1eje16;
Var
	peso,precio:real;
	categoria:char;
Begin
	write('Ingrese el peso en kg de la carga: ');readln(peso);
	write('Elija la categoria: 1- Comun / 2- Especial / 3- Aereo : ');readln(categoria);

	Case  categoria of
		'1': precio:= peso * 2;
		'2': precio:= peso * 2.5;
		'3': precio:= peso * 3;
	end;
	
	If (peso > 15) then
		precio:= precio * 1.3
	Else if (peso > 10) and (peso <= 15) then
		precio:= precio * 1.2
	Else if (peso > 5) and (peso <= 10) then
		precio:= precio * 1.1;
		
	writeln(' ');
	writeln('El precio de su carga es: ',precio:2:0);
end.
		
