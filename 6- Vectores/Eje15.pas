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
	For i:= 1 to N do
	begin
		B[M]:= A[i];
		M:= M + 1;
	end;
end;

Procedure InsertaOrdenado ( Var B: TV;  M: Byte);
Var
	J: Byte;
Begin
	J:= M;
	While (J > 0)  do
	Begin
		B[ J+1 ] := B [ j ] ; J := J-1;
	End;
	M := M+1;
End; 



Var
	A,B:TV;
	N,M:byte;
Begin
	LeeVector(A,N);
	GenerarArray(A,N,B,M);
	InsertaOrdenado(B,N);
end.
