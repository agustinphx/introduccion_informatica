Program archivo;
Var
	arch:text;
	N,i:byte;
	patente:string[6];
	anio:word;
	espacio:char;
Begin
	N:=0;
	assign(arch,'patentes.txt'); reset(arch);
	readln(arch,N);
For i:= 1 to n do
	begin
		read(arch,patente);
		writeln(patente);
		read(arch, anio);
		writeln(anio);
		For i:= 1 to N  
		begin
			readln(arch, espacio,patente);
			read(arch,anio);
			if anio = 0 then
				readln(arch);
		end;
	end;
	close(arch);
end.
