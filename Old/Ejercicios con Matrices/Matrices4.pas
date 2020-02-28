Program RecorriendoUnArray
;
Type
TipoMatriz = Array[0..100,0..100] of integer;

Var
	Matriz:TipoMatriz;
	N,M:byte;
Procedure LeerMatriz( Var Matriz:TipoMatriz; Var  N,M:byte);

Var
	i,j:byte;

Begin
Write('Ingrese la cantidad de filas'); Readln(N);
Write('Ingrese la cantidad de columnas'); Readln(M);

For i:= 1 to N do
	For j:= 1 to M do
		Begin
		write('Fila,Columna',i:3,j:3);
		end
end;

Procedure ImprimirMatriz( Var Matriz:TipoMatriz; Var N,M:byte);
Var
	i,j:byte;
Begin
For i:= 1 to N do
	For j:= 1 to M do
		write(Matriz[i,j]);
end;

	


BEGIN
	LeerMatriz(Matriz,N,M);
	
	
END.
