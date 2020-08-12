{Una matriz cuadrada A se dice es simétrica si A[i, j] = A [j, i] para todo i, j dentro de los límites de
matriz. Escribir una función que determine:
a. Cuantos elementos simétricos son diferentes.
b. Verificar si es o no simétrica.}
Program Eje4;
Type
	TM = array[1..10, 1..10] of integer;

Procedure LeerMatriz(Var A:TM; Var N,M:byte);
Var
	i,j:byte;
begin
	write('Ingrese la cantidad de filas: ');readln(N);
	write('Ingrese la cantidad de columnas: ');readln(M);
	For i:= 1 to N do
		For j:= 1 to M do
		begin
			write('Ingrese un numero para la posicion ',i:3,j:3,' : ');readln(A[i,j]);
		end;
end;

Function Cuenta(A:TM; N,M:byte):byte;
Var
	i,j,Cont:byte;
begin
	Cont:= 0;
	For i:= 1 to N do
		For j:= 1 to M do
		begin
			If (A[i,j] <> A[j,i])  then
				Cont:= Cont + 1;	
		end;
	Cuenta:= Cont;
end;
	
Var
	A:TM;
	N,M,Cont:byte;
Begin
	LeerMatriz(A,N,M);
	Cont:= Cuenta(A,N,M);
	writeln;
	If (Cont = 0) then
		writeln('La matriz es simetrica')
	Else
		writeln('La cantidad de elementos simetricos diferentes son: ',Cont);
end.
