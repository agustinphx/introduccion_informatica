{Ingresar una matriz de MxN de enteros, escribir:
a. Los elementos junto con la fila cuya suma de componentes sea la mayor.
b. Los elementos junto con la columna cuya suma de componentes sea la menor.
c- El minimo elemento de la matriz.}
Program eje2;
Type
	TM = array[1..4, 1..4] of integer;
	TV = array[1..4] of integer;
	
Procedure LeerMatriz(Var Mat:TM; Var N,M:byte);
Var
	i,j:byte;
begin
	write('Ingrese la cantidad de filas: ');readln(N);
	write('Ingrese la cantidad de columnas: ');readln(M);
	For i:= 1 to N do
		For j:= 1 to M do
		begin
			write('Ingrese un numero para la posicion ',i:3,j:3,' : ');readln(Mat[i,j]);
		end;
end;


Procedure Imprime(Mat:TM; N,M:byte);
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

Function Minimo(Mat: TM; N,M: byte): integer;
Var
i,j: byte; Min: integer;
Begin
	Min:= Mat[1,1];
	For i := 1 to N do
		For j:= 1 to M do
			If Min > Mat[i,j] Then
				Min:= Mat[I,j];
		Minimo:= Min;
End;

Procedure FilaMayor(Mat:TM; SF:TV; N,M:byte); //La suma es un vector, osea, cada fila debemos sumarla mediante un vector.
Var
	i,j,Fila:byte;
	Max:integer;
begin
	Max:= 0;
	For i:= 1 to N do // Para calcular bien la suma de cada fila debemos recorrerla de esta forma.
	begin
		For j:= 1 to M do
			SF[i]:= SF[i] + Mat[i,j];
		
		If (SF[i] > Max) then
		begin
			Max:= SF[i];
			Fila:= i;
		end;	
	end;
	
	writeln('La fila ',Fila,' tiene la mayor suma con: ',Max);
	For j:= 1 to M do
		write(Mat[Fila,j]:3);
	writeln;
end;

Procedure ColumnaMenor(Mat:TM;SC:TV; N,M:byte);
Var
	i,j,Columna:byte;
	Min:integer;
begin
	Min:= 999;
	For j:= 1 to M do // Para calcular bien la suma de cada columna debemos recorrerla de esta forma.
	begin
		For i:= 1 to N do
			SC[j]:= SC[j] + Mat[i,j];
		
		If (SC[j] < Min) then
		begin
			Min:= SC[j];
			Columna:= j;
		end;
	end;
	
	writeln('La columna ',Columna,' tiene la menor suma con: ',Min);
	For i:= 1 to N do
		writeln(Mat[i,Columna]:3);
	writeln;	
end;	
	

Var
	Mat:TM;
	SF,SC:TV;
	N,M:byte;

Begin
	LeerMatriz(Mat,N,M);
	writeln;
	writeln('Matriz original');
	Imprime(Mat,N,M);
	writeln;
	FilaMayor(Mat,SF,N,M);
	writeln;
	ColumnaMenor(Mat,SC,N,M);
	writeln;
	writeln('El minimo elemento de la matriz es: ',Minimo(Mat,N,M));
end.
