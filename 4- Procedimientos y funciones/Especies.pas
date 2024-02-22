{En un torneo de pesca, compiten 3 categorías.
* Se capturan N especies diferentes registrándose por cada una:
* Código de especie(cadena de 2 caracteres) y en cada una:
* Categoria(1,2,3; 0 fin de datos).
* Peso.
* Se pide desarrollar un programa Pascal que resuelva:
* a) Para cada especie,total de ejemplares por categoría.
* b) Peso promedio de cada especie considerando todas las capturas del torneo.
* c) Realizar una funcion para calcular la cantidad total de ejemplares de más de 2 kgs.}
Program Especies;

Function Mas2kg(Peso:real):byte;
Var
	Cont:byte;
Begin //La variable Cont no debe ser inicializada dentro de la funcion porque sino el resultado va ser reseteado y sera siempre 0.	
	If (Peso > 2) then
		Cont:= Cont + 1;
		
	Mas2kg:= Cont;
end;

Var
	Esp:string[2];
	i,N,Cat,Cont1,Cont2,Cont3,ConTotal,Cont:byte;
	Peso,Prom,Acum:real;
	arch:text;
Begin
	Cont1:= 0;
	Cont2:= 0;
	Cont3:= 0;
	ConTotal:= 0;
	Cont:= 0;
	Acum:= 0;
	assign(arch,'Especies.txt');reset(arch);
	readln(arch,N);
	For i:= 1 to N do
	begin
		readln(arch,Esp);
		read(arch,Cat);
		while (Cat <> 0) do
		begin
			readln(arch,Peso);
			Acum:= Acum + Peso;
			
			Case Cat of
				1:Cont1:= Cont1 + 1;
				2:Cont2:= Cont2 + 1;
				3:Cont3:= Cont3 + 1;
			end;
				
			Cont:= Mas2kg(Peso);
			read(arch,Cat);
		end;
		ConTotal:= Cont1 + Cont2 + Cont3;
		Prom:= Acum / ConTotal;
		readln(arch);
	end;
	close(arch);
	writeln('a- La cantidad de ejemplares de la categoria 1 son: ',Cont1);
	writeln('a- La cantidad de ejemplares de la categoria 2 son: ',Cont2);
	writeln('a- La cantidad de ejemplares de la categoria 3 son: ',Cont3);
	writeln;
	writeln('b- Peso promedio del total de ejemplares : ',Prom:2:0);
	writeln;
	writeln('c- La cantidad de ejemplares que pesan mas de 2kg son: ',Cont);
	
end.
