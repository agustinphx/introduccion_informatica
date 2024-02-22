{Ingresar una matriz de N x M de enteros resolver mediante procedimientos o funciones los siguientes
puntos y mostrar el resultado:
(Maximo de filas y columnas:6).
a. Dado un número, calcular cuantas veces se repite (puede no estar).
b. Indicar cuántos elementos son nulos, positivos y negativos.
c. Intercambiar la fila K con la fila H (K y H menor o igual que N)}
Program Eje1;
Type
	TM = array[1..6, 1..6] of integer;

Procedure LeerMatriz(Var Mat:TM; Var N,M:byte);
Var
	i,j:byte;
begin
	write('Ingrese la cantidad de filas (menor a 6): ');readln(N);
	write('Ingrese la cantidad de columnas(menor a 6): ');readln(M);
	For i:= 1 to N do
		For j:= 1 to M do
		begin
			write('Ingrese un numero para fila y columna',i:3,j:3,' : ');readln(Mat[i,j]);
		end;
end;


Procedure Imprime(Mat:TM; N,M:byte);
Var
	i,j:byte;
begin
	For i:= 1 to N do
	begin
		For j:= 1 to M do
			write(Mat[i,j]:4);
		writeln; // Al terminar la fila i, salta a la siguiente linea, esta es necesaria para que al imprimirla este bien de manera visual.
	end;
end;

Function Repeticiones(Mat:TM; N,M:byte; Num:integer):byte; //Resuelve A.
Var
	i,j,Cont:byte;
begin
	Cont:= 0;
	For i:= 1 to N do
		For j:= 1 to M do
		begin
			If (Mat[i,j] = Num) then
				Cont:= Cont + 1;
		end;
	Repeticiones:= Cont;
end;

Procedure CuentaPosNeg(Mat:TM; N,M:byte); //Resuelve B.
Var
	i,j,ContP,ContN,Cont0:byte;
begin
	ContP:= 0; //Contador para positivos.
	ContN:= 0; //Contador para negativos.
	Cont0:= 0; //Contador para nulos.
	For i:= 1 to N do
		For j:= 1 to M do
		begin
			If (Mat[i,j] > 0) then
				ContP:= ContP + 1
			Else
				if (Mat[i,j] < 0) then
					ContN:= ContN + 1
				Else
					Cont0:= Cont0 + 1;
		end;
	writeln('La cantidad de elementos positivos en la matriz son: ',ContP);
	writeln('La cantidad de elementos negativos en la matriz son: ',ContN);
	writeln('La cantidad de elementos nulos en la matriz son: ',Cont0);
end;

Procedure IntercambiarFilas(Var Mat:TM; N,M:byte);// Resuelve C
Var
	j,K,H,aux:byte;
	
begin
	write('Ingrese una de las filas a intercambiar: ');readln(K);
	write('Ingrese la otra fila para intercambiar: ');readln(H);
	For j:= 1 to M do
	begin
		If (K <= N) and (H <= N) then
		begin
			aux:= Mat[K,j];
			Mat[K,j]:= Mat[H,j];
			Mat[H,j]:= aux;
		end;
	end;
end;

Var
	Mat:TM;
	N,M,Aux:byte;
	Num:integer;
Begin
	LeerMatriz(Mat,N,M);
	writeln;
	writeln('Matriz');
	Imprime(Mat,N,M);
	writeln;
	CuentaPosNeg(Mat,N,M);
	writeln;
	write('Ingrese un numero para saber si esta: ');readln(Num);
	
	Aux:= Repeticiones(Mat,N,M,Num);
	If (Aux = 0) then
		writeln('El numero ingresado no esta en la matriz')
	Else
		writeln('La cantidad de veces que ',Num,' se repite son: ',Aux);
		
	writeln;
	IntercambiarFilas(Mat,N,M);
	writeln;
	writeln('Matriz con filas intercambiadas');
	Imprime(Mat,N,M);
end.	

