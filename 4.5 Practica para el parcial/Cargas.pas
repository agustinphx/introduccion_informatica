{N empresas de transportes realizan envíos de cargas, por cada bulto se
ingresa PESO de la carga (número real) y CATEGORIA (dato codificado: C -
común , E - especial , A – aéreo).
El precio se calcula a $25 por Kg para categoría común, $32.5 por Kg para
categoría especial y $50 por Kg para categoría aérea. Se cobra recargo por
sobrepeso: 30% si sobrepasa los 15 Kg, 20% si pesa más de 10 Kg y hasta 15Kg
inclusive, 10% más de 5Kg y hasta 10 Kg inclusive.
Se desea calcular y mostrar el importe a pagar por cada uno de bultos al final
del proceso el total recaudado por cada empresa y en cada una de las tres categorías.
Implementar y utilizar función Precio correctamente parametrizada que devuelva el
importe a pagar por un bulto.}
Program cargas;
Function Precio(Peso:real; Cat:char):real;
Var
	Pr:real;
Begin
	Case Cat of
		'C':Pr:= Peso * 25;
		'E':Pr:= Peso * 32.5;
		'A':Pr:= Peso * 50;
	end;
	 
	If (Peso <= 10) then
		Pr:= Pr * 1.1
	Else
		if (Peso <= 15) then
			Pr:= Pr * 1.2
		Else
			Pr:= Pr * 1.3;
	
	Precio:= Pr;
end;

Var
	Emp:string[11];
	i,N:byte;
	Cat,Esp:char;
	Peso,Pr,Acum,AcumC,AcumE,AcumA:real;
	arch:text;
Begin
	AcumC:= 0; //Estras tres variables deben ser inicializadas antes del ciclo For porque sino no acumulará bien los resultados por categoria.
	AcumE:= 0;
	AcumA:= 0;
	assign(arch,'Cargas.txt');reset(arch);
	readln(arch,N);
	For i:= 1 to N do
	begin
		Acum:= 0; //Debe ser inicializada antes del ciclo while porque sino no acumulará bien el total por empresa.
		readln(arch,Emp);
		read(arch,Peso,Esp);
		while (Peso <> 0) do
		begin
			readln(arch,Cat);
			Pr:= Precio(Peso,Cat);
			Acum:= Acum + Pr;
			
			If (Cat = 'C') then
				AcumC:= AcumC + Pr
			Else
				if (Cat = 'E') then
					AcumE:= AcumE + Pr
				Else
					AcumA:= AcumA + Pr;
			
			writeln(Emp,' facturo por el bulto: ',Peso:2:0,Esp,Cat,' $',Pr:2:0);
			read(arch,Peso,Esp);
		end;
		readln(arch);
		writeln(Emp,' recaudo en total: $',Acum:2:0);
		writeln;
	end;
	close(arch);
	writeln('La categoria comun recaudo: $',AcumC:2:0);
	writeln('La categoria especial recaudo: $',AcumE:2:0);
	writeln('La categoria aerea recaudo: $',AcumA:2:0);
end.
