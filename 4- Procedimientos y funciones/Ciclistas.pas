{En un entrenamiento de ciclismo cada participante se registra el nombre,sus pulsaciones y la velocidad máxima alcanzada 
Se pide desarrollar un programa Pascal que lea de teclado los datos mencionados, obtenga e
informe:
Realizar una funcion para la cantidad de corredores de categoría B con nivel de riesgo 2
La cantidad de participantes en cada categoría.
El porcentaje de participantes cuyo de nivel de riesgo es 3}
Program Ciclistas;
Function CantidadCategoriaA(Vel,Pul:byte):byte;
Var
	Cant:byte;
begin
	If (Pul <= 160) and (Vel <= 49) then
		Cant:= Cant + 1;
		
	CantidadCategoriaA:= Cant;
end;

Var
	Nom:string[7];
	i,N,Pul,Vel,CantB2,ContA,ContB,ContC,Cont3:byte;
	Porc:real;
	arch:text;
Begin
	CantB2:= 0;
	ContA:= 0;
	ContB:= 0;
	ContC:= 0;
	Cont3:= 0;
	assign(arch,'Ciclistas.txt');reset(arch);
	readln(arch,N);
	For i:= 1 to N do
	begin
		readln(arch,Nom);
		read(arch,Pul);
		while (Pul <> 0) do
		begin
			readln(arch,Vel);
			
			Case Vel of
				1..39:ContC:= ContC + 1;
				40..49:ContB:= ContB + 1;
				50..100:ContA:= ContA + 1;
			end;
	
			If (Pul > 160) then
				Cont3:= Cont3 + 1;

			CantB2:= CantidadCategoriaA(Vel,Pul);
			read(arch,Pul);
		end;
		readln(arch);
	end;
	Porc:= (Cont3 / N) * 100;
	close(arch);
	writeln('a- La cantidad de ciclistas de la categoria B con nivel de riesgo 2 son: ',CantB2);
	writeln;
	writeln('b- La cantidad de ciclistas de la categoria A son: ',ContA);
	writeln('b- La cantidad de ciclistas de la categoria B son: ',ContB);
	writeln('b- La cantidad de ciclistas de la categoria C son: ',ContC);
	writeln;
	writeln('c- El porcentaje de los ciclistas son nivel de riesgo 3 es: ',Porc:2:0,' %');
	
end.
