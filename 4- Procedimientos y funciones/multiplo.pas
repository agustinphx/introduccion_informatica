{Leer pares de números enteros desde un archivo de texto y para cada uno de ellos verificar
mediante función booleana si el mayor de ellos es múltiplo del menor, además calcular e
imprimir el porcentaje de los pares que cumplen.}
Program eje1;

Function Multiplo(Max,Min:integer):boolean;
Begin
	If (Max mod Min = 0) then
	begin
		Multiplo:= true;
		writeln('El mayor es multiplo del menor');
	end;
end;

Var
	NumA,NumB,Mayor,Menor:integer;
	ContM,ContP:word;
	Espacio:char;
	Porc:real;
	Arch:text;
Begin
	Assign(Arch,'multiplos.txt');reset(Arch);
	ContP:= 0;
	While not eof (arch) do
	begin
		Mayor:= -999;
		Menor:= 999;
		ContM:= 0;
		read(Arch,NumA,Espacio,NumB);
		writeln(NumA,Espacio,NumB);	
		ContP:= ContP + 1;
		
		If (NumA > NumB) then
		begin
			Mayor:= NumA;
			Menor:= NumB;
		end
		Else
		begin	
			Mayor:= NumB;
			Menor:= NumA;
		end;
		
		If Multiplo(Mayor,Menor) then 
			ContM:= ContM + 1;
		
		Porc:= (ContM / ContP) * 100;		
		writeln('El mayor es: ',Mayor);
		writeln('El menor es: ',Menor);	
		writeln('---------------');
		readln(Arch);
	end;
	close(Arch);
	writeln('Los pares que cumplen son: ',ContM);
	writeln('El porcentaje de los pares de numeros que cumplen es: ',Porc:2:0,'%');
end.
