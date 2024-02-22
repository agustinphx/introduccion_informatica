{ Leer números desde un archivo e informar la cantidad de veces en que un número es igual al que le
antecede}
Program eje8;
Var
	Num,X:integer;
	Cont:word;
	arch:text;
Begin
	Cont:= 0;
	Assign(arch,'antecede.txt');reset(arch);
	write('Ingrese el numero que antecede: ');readln(X);
	While not eof (arch) do
	begin
		read(arch,Num);
		If (Num = X ) then
		begin
			Cont:= Cont + 1;
			writeln(Num); //Numero que antecede repetido la cantidad de veces que antecede.
		end;
	end;
	close(arch);
	writeln('La cantidad de veces que antecede son: ',Cont);
end.
