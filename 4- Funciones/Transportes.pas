{Una empresa de transportes realiza envíos de cargas, por cada bulto se
ingresa PESO de la carga (número real) y CATEGORIA (dato codificado: 1 -
común , 2 - especial , 3 – aéreo).
El precio se calcula a $25 por Kg para categoría común, $32.5 por Kg para
categoría especial y $50 por Kg para categoría aérea.Se cobra recargo por
sobrepeso: 30% si sobrepasa los 15 Kg, 20% si pesa más de 10 Kg y hasta 15Kg
inclusive, 10% más de 5Kg y hasta 10 Kg inclusive.
Se desea calcular y mostrar el importe a pagar por cada uno de N bultos y al final
del proceso el total recaudado en cada una de las tres categorías.
Implementar y utilizar función Precio correctamente parametrizada que devuelva el
importe a pagar por un bulto.}
Program Transportes;

Function Precio(Pes:real; Ca:char):real;
Var
	Pr:real;
Begin
	Pr:= 0;
	
	If (Ca = '1') then
		Pr:= Pes * 25
	Else
		if (Ca = '2') then
			Pr:= Pes * 32.5
		Else
			Pr:= Pes * 50;
	
	If (Pes <= 10) then
		Pr:= Pr * 1.1
	Else
		if (Pes <= 15) then
			Pr:= Pr * 1.2
		Else
			Pr:= Pr * 1.3;

	Precio:= Pr;
end; 


Var
	i,N:word;
	Cat:char;
	Peso,Pr,AcumA,AcumE,AcumC:real;	
Begin
	AcumC:= 0;
	AcumE:= 0;
	AcumA:= 0;
	Pr:= 0;
	write('Ingrese la cantidad de bultos: ');readln(N);
	For i:= 1 to N do
	begin
		write('Ingrese el peso de la carga: ');readln(Peso);
		write('Ingrese la categoria: 1- Comun / 2- Especial / 3- Aereo : ');readln(Cat);
		writeln('El importe a abonar por este bulto es: $',Precio(Peso,Cat):2:0);		
		writeln;
		Pr:= Precio(Peso,Cat);
		
		If (Cat = '1') then //Acumulamos segun cada categoria  y luego le sumamos el valor que retorna la funcion para ir acumulando.
			AcumC:= AcumC + Pr
		Else
			if (Cat = '2') then
				AcumE:= AcumE + Pr
			Else
				AcumA:= AcumA + Pr;
	end;
	writeln('El total recaudado por la categoria 1 es: $',AcumC:2:0);
	writeln('El total recaudado por la categoria 2 es: $',AcumE:2:0);
	writeln('El total recaudado por la categoria 3 es: $',AcumA:2:0);


end.
