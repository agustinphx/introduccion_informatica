Program testing;

Function ImporteConsulta(Mutual:byte; Turno:char; Recargo:real):real;
Var
	Precio:real;
begin
	Precio:= 0;
	Case Mutual of
		1:Precio:= 0;
		2:Precio:= 350;
		3:Precio:= 200;
		4:Precio:= 800;
	end;
	
	Recargo:= (Recargo * Precio) / 100;
	
	If (Turno = 'N') then
	begin
		if (Recargo > 50) then
			Precio:= Precio + Recargo
		Else
			Precio:= Precio + 50;
	end;
	ImporteConsulta:= Precio;
end;

Var
	Mutual,i,N,X,CantP,Cont:byte;
	Turno,Espacio:char;
	Matricula,Max:word;
	Prom,Acum:real;
	arch:text;
Begin
	CantP:= 0; //Debe ser inicializada fuera del ciclo que recorremos el archivo porque sino cuenta solo 1 particular.
	assign(arch,'Mutual.txt');reset(arch);
	readln(arch,N);
	readln(arch,X);
	
	For i:= 1 to N do
	begin
		Max:= 1200;
		Acum:= 0; //Debe ser inicializada antes del siguiente ciclo que modifica su valor.
		Cont:= 0; //Debe ser inicializada antes del siguiente ciclo que modifica su valor.
		readln(arch,Matricula);
		read(arch,Mutual,Espacio,Turno);
		
		while (Mutual <> 0) do
		begin
			Acum:= Acum + ImporteConsulta(Mutual,Turno,X);
			Cont:= Cont + 1;
			
			If (Acum > Max) then
				writeln('a- Matricula del medico que mas cobro: ',Matricula);
				
			If (Mutual = 4) then
				CantP:= CantP + 1;
				
			read(arch,Mutual,Espacio,Turno); //Leemos a lo ultimo para no sobreescribir el promedio.
		end;
		Prom:= Acum / Cont;
		writeln('b- ',Matricula,' promedio: $',Prom:2:0);
		writeln;
	end;
	close(arch);
	writeln('c- La cantidad de pacientes que se atendio de manera particular son: ',CantP);
end.
