{- A partir de un arreglo A de reales desordenado, se pide generar otro arreglo B con los mismos
elementos de A ordenados, utilizando el procedimiento InsertaOrdenado(}
Program eje15;
Type
	TV = array [0..100] of real;
	
Procedure LeeVector(Var A:TV; Var N:byte);
Var
	i:byte;
begin
	write('Ingrese la cantidad de elementos del vector: ');readln(N);
	For i:= 1 to N do
	begin
		write('Ingrese un numero: ');readln(A[i]);
	end;
end;

Procedure GenerarArray(A:TV; N:byte; Var B:TV; Var M:byte);
Var
	i:byte;
begin
	M:= 0;
	For i:= 1 to N - 1 do
	begin
		If (A[i] > A[i + 1]) then
		begin
			B[M]:= A[i];
			M:= M + 1;
		end;
	end;
end;

Procedure Burbujeo (Var A:TV; N:byte; B:TV);
Var
	aux:real;
	i,K,Tope :byte;
begin
	Tope:= N ;
	Repeat
		K:= 0;
		For i := 1 to Tope -1 do
			If A[i] > A[i+1] then
			begin
				aux:= B[i];
				B[i]:= B[i+1]; 
				B[i+1]:=aux;
				K:= i ;
			end;
			Tope:= K ;
	Until K <=1;
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
Begin
	LeeVector(A,N);
	GenerarArray(A,N,B,M);
	Burbujeo(A,N,B);
	writeln;
	Imprime(B,M);
end.
