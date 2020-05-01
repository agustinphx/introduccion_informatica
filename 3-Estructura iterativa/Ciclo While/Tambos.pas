{Una compañía Láctea recibe la producción diaria, en litros de leche de N Tambos de la zona,
durante varios días consecutivos.
Se desea conocer:
a) Para cada Tambo, Nombre y el día que más litros de leche entregó.
b) Promedio total de leche entregado por Tambo.
c) Cuántos Tambos superaron los X litros. (X es dato)}
Program tambos;
Var
	Tambo:String[13];
	Dia:byte;
	N,Cont,ContM,Acum,MaxDia,X,Litros,MaxLitros:word;
	Espacio:char;
	Prom:real;
	Arch:text;
begin
	MaxDia:= 0;
	MaxLitros:= 0;
	assign(Arch,'tambos.txt');reset(Arch);
	readln(Arch,N);
	While not eof (Arch) do
	begin
		Cont := 0;
		ContM := 0;
		Acum:= 0;
		X:= 750;
		readln(Arch,Tambo);
		read(Arch,Dia,Espacio,Litros);
		While (Dia <> 0) do
		begin
			read(Arch,Dia,Espacio,Litros);
			Acum:= Acum + Litros;
			Cont:= Cont + 1;
		end;
			
		If (Litros > MaxLitros) then
		begin
			MaxLitros:= Litros;
			MaxDia:= Dia;
		end;
		If (Litros > X) then
			ContM:= ContM + 1;

	Prom:= Acum / Cont;
	end;
	Close(Arch);
	writeln('a- ',Tambo,' dia: ',MaxDia,' entrego: ',MaxLitros,' litros');
	writeln('b- ',Tambo,' promedio de leche entregada: ',Prom:2:0);
	writeln('c- Los tambos que superaron: ',X,' litros son: ',ContM);
end.
