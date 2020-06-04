{- A partir de un arreglo A de reales desordenado, se pide generar otro arreglo B con los mismos
elementos de A ordenados, utilizando el procedimiento InsertaOrdenado(}
Program eje15;
Type
	TV = array [0..100] of real;
	
Procedure LeeVector(Var A:TV; Var N:byte);
Var
	i:byte;
	Num:real;
begin
	write('Ingrese la cantidad de elementos del vector: ');readln(N);
	For i:= 1 to N do
	begin
		write('Ingrese un numero: ');readln(Num);
		A[i]:= Num;
	end;
end;

Procedure GenerarArray(A:TV; N:byte; Var B:TV; Var M:byte);
Var
	i:byte;
begin
	M:= 0;
	For i:= 1 to N do
	begin
		//If (A[i] < Num) then
		//begin
			B[M]:= A[i];
			M:= M + 1;
		//end;
	end;
end;

Procedure InsertaOrdenado(Var B:TV; Var M:byte; Num:real);
Var
	i:byte;
begin
	i:= M;
	while (i > 0) and (B[i] < Num) do
	begin
		B[i + 1]:= B[i]; 
		i:= i - 1;
	end;
	B[i + 1]:= Num;
	M:= M + 1;
end;

Procedure Imprime(B:TV; M:byte);
Var
	i:byte;
begin
	For i:= 1 to M do
		writeln(B[i]:2:0);
end;

Var
	A,B:TV;
	N,M:byte;
	Num:real;
Begin
	LeeVector(A,N);
	GenerarArray(A,N,B,M);
	InsertaOrdenado(B,N,Num);
	writeln;
	Imprime(B,M);
end.
