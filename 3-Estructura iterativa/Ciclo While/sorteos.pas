{-En un sorteo de lotería se extraen los numeros 2,5,1,19,3,12,3,13,9,1,7,29,2,8,1,14,37,16. 
Se pide ingresar los datos de cada uno de los últimos N sorteos e informar:
a) La cantidad de sorteos que han tenido al menos un número impar.
b) El número par más alto de cada sorteo, indicar cuándo no haya habido }
Program sorteos;
Var
	ContI,ContP,Num:word;
	MaxP:integer;
	arch:text;
Begin
	ContI:= 0;
	ContP:= 0;
	MaxP:= -9999;
	Assign(arch,'sorteo.txt');reset(arch);
	While not Eof (arch)  do
	begin
		readln(arch,Num);
		
		If (Num > MaxP) and (Num MOD 2 = 0) then //Calcula el maximo de los pares.
			MaxP:= Num;
			
		If (Num MOD 2 = 0) then
			ContP:= ContP + 1
		Else
			ContI:= ContI + 1;
	end;
	close(arch);
	writeln('La cantidad de sorteos con numeros impares son: ',ContI);
	writeln('La cantidad de pares son: ',ContP);
	writeln('El numero par mas alto es: ',MaxP);
end.
