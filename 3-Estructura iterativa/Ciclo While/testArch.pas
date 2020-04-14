{Testeando la lectura de archivo}
Program testArch;
Var
	Nom:string[6];
	i,N,Cont:word;
	Edad:byte;
	Alt:real;
	Arch:text;
Begin
	Cont:= 0;
	Assign(Arch,'testArch.txt');reset(Arch);
	readln(Arch,N);
	while not eof (Arch) do
	begin
		For i:= 1 to N do
		begin
			readln(Arch,Nom,Edad,Alt);
			writeln(Nom,Edad,Alt);
			
			If (Alt > 1.60) then
				Cont:= Cont + 1;
		end;
	end;
	writeln('La cantidad de personas con altura mayor a 1.60 son: ',Cont);
end.
