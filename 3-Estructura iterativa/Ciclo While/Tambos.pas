{Una compañía Láctea recibe la producción diaria, en litros de leche de N Tambos de la zona,
durante varios días consecutivos.
Se desea conocer:
a) Para cada Tambo, Nombre y el día que más litros de leche entregó.
b) Promedio total de leche entregado por Tambo.
c) Cuántos Tambos superaron los X litros. (X es dato)}
Program Tambos;
Const
	X = 750;
Var
	Dia,MaxDia,SumDias,i,N,ContX:byte;
	Tambo:string[13];
	Litros,MaxLitros,AcumLitros:word;
	Prom:real;
	Arch:text;
Begin
	Assign(Arch,'Tambos.txt');reset(Arch);
	readln(Arch,N);
	For i:= 1 to N do
	begin
		AcumLitros:= 0;
		MaxDia:= 0;
		MaxLitros:= 0;
		SumDias:= 0;
		ContX:= 0;
		readln(Arch,Tambo);
		read(Arch,Dia);
		While (Dia <> 0) do
		begin	
			readln(Arch,Litros);
			AcumLitros:= AcumLitros + Litros;
	
			If (Litros > MaxLitros) then
			begin	
				MaxLitros:= Litros;
				MaxDia:= Dia;
			end;
			
			If (AcumLitros > X) then
				ContX:= ContX + 1;
				
			read(Arch,Dia); //Debemos leer dia despues de asignar el maximo dia porque sino el primer tambo mostará dia: 0.
			SumDias:= SumDias + 1;	
		end;
		Prom:= AcumLitros / SumDias;
			
		writeln('a- ',Tambo,' entrego ',MaxLitros,' litros el dia: ',MaxDia);
		writeln('b- ',Tambo,' promedio de leche entregada: ',Prom:2:0,' litros');
		writeln;
		readln(Arch);
	end;
	Close(Arch);
	writeln('c- La cantidad de tambos que superaron ',X,' litros son: ',ContX);
end.
