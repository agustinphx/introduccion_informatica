{Se tiene un conjunto de números primos y por cada uno de ellos N números no primos.
y a continuación por cada primo P, N números no primos.
Se pide leer de archivo e informar la cantidad de primos y no primos.
Para cada primo porcentaje de no múltiplos entre los  no primos.
Número primo con múltiplo mayor.}
Program primos;
Var
	Num,P:integer;
	N,ContP,Cont,ContM,ContNM:word;
	arch:text;
	espacio:char;
	Porc,Max,MaxP:real;
Begin
	ContP:= 0;//Cuenta los numeros primos.
	Cont:= 0; //Cuenta los numeros no primos.
	ContM:= 0; //Cuenta los multiplos de numeros primos.
	ContNM:= 0; //Cuenta los no multiplos de los no primos.
	Max:= 0;
	Assign(arch,'primos.txt');reset(arch);
	readln(arch,N);
	write('Ingrese un numero primo: ');readln(P);
	While not eof (arch) do
	begin
			read(arch,Num); //Ahora puedo leer todos los numeros por la variable: ''espacio''.
			read(arch,espacio);
		If (Num MOD P = 0) then
		begin	
			ContP:= ContP + 1;
			ContM:= ContM +1; 
		end
		Else
		begin
			Cont:= Cont  + 1;
			ContNM:= ContNM + 1;
		end;
		 Porc:= (ContM / N) * 100;
		  
		If Porc > Max then
		begin
			Max:= Porc; 
			MaxP:= P;
		end;			
	end;
	close(arch);
	writeln('La cantidad de primos son: ',ContP);
	writeln('La cantidad de no primos son: ',Cont);
	writeln('El porcentaje  de no multiplos de los no primos es: ',Porc:6:2);
	writeln('El numero primo con mayor multiplo es: ',MaxP:6:2);
	end. 
end.
