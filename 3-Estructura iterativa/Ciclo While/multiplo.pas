{4.-Dado un conjunto de números enteros distintos de cero:
Ingresar un valor entero X por teclado y luego:
a) Informar el mayor múltiplo de X, poniendo un cartel aclaratorio si no existiera.
b) Generar un Archivo ‘Multiplo.TXT’ con todos los múltiplos de X que hubiera. . }
Program multiplo;
Var
	Cont:word;
	Num,Mayor,X:shortint;
	arch:text;
Begin
	Cont:= 0;
	Mayor:= 0;
	Assign(arch,'multiplo.txt');reset(arch);
	write('Ingrese un numero: ');readln(X);
	While not eof (arch) do
	Begin
		readln(arch,Num);
		If (Num MOD X = 0) and (Mayor < Num) then
		begin
			Cont:= Cont + 1;
			Mayor:= Num;
		end;
	end;
	close(arch);
	writeln(' ');
	If ( Mayor = Num) then
		writeln('No existe un mayor multiplo de: ',X);
		
	writeln('El multiplo mayor de X es: ',Mayor);
end.
