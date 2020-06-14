{Dada una matriz A de NxM elementos enteros, se desea generar un arreglo lineal B con los
elementos de la matriz A que cumplan:
A[fila, columna] <= 0 para fila impar y columna impar ó
A[fila, columna] > 0 para fila par y columna par
 	1  8 -6 -7
A = 4  6  3  2    B= -6 6 2 0
	0 -5  9 13}
Program Eje3;
Type
	TM = array[1..50,1..50] of integer;
	TV = array[1..50] of integer;

Procedure LeerMatriz(Var Mat:TM; Var N,M:byte);
Var
	i,j:byte;
begin
	write('Ingrese la cantidad de filas: ');readln(N);
	write('Ingrese la cantidad de columnas: ');readln(M);
	For i:= 1 to N do
		For j:= 1 to M do
		begin
			write('Ingrese un numero: ');readln(Mat[i,j]);
		end;
end;

Procedure ImprimeMatriz(Mat:TM; N,M:byte);
Var
	i,j:byte;
begin
	For i:= 1 to N do
	begin
		For j:= 1 to M do
			write(Mat[i,j]:3);
		writeln;
	end;
end;

Procedure GenerarArray(Mat:TM; N,M:byte; Var B:TV; Var L:byte);
Var
	i,j:byte;
begin
	L:= 0;
	For i:= 1 to N do
		For j:= 1 to M do	
		begin
			If (i MOD 2 = 0) and (j MOD 2 = 0) then
			begin
				If (Mat[i,j] > 0) then
				begin
					L:= L + 1;
					B[L]:= Mat[i,j];
				end;
			end
			Else
				If (i MOD 2 <> 0) and (j MOD 2 <> 0) then
				begin
					If (Mat[i,j] <= 0) then
					begin
						L:= L + 1;
						B[L]:= Mat[i,j];
					end;
				end;
		end;
end;

Procedure ImprimeVector(B:TV; L:byte);
Var
	i:byte;
begin
		For i:= 1 to L do
			write(B[i]:3);
		writeln;
end;

Var
	Mat:TM;
	B:TV;
	N,M,L:byte;
Begin
	LeerMatriz(Mat,N,M);
	GenerarArray(Mat,N,M,B,L);
	writeln('Matriz original');
	ImprimeMatriz(Mat,N,M);
	writeln;
	writeln('Vector B');
	ImprimeVector(B,L);
end.
