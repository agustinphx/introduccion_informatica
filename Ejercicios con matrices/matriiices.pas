Program Matrices;
Var
	matriz: tipomatriz;
	N,M:byte;
Type
tipomatriz = array[1..3 , 1..4] of integer;


Procedure LeeMatriz(Var Mat: TipoMatriz; Var N, M :byte);
Var
	i, j: byte;
	Begin
	Write ('Ingrese cantidad de filas'); Readln(N);
	Write ('Ingrese cantidad de columnas'); Readln(M);
	For i:= 1 to N do
	For j:= 1 to M do
	Begin
	Write('fila, columna ', i:3, j:3); Readln(Mat[i, j]);
	end
end;9
