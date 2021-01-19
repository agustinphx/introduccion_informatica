{La sala de un teatro tiene N filas con M butacas cada una y ha representado la 
ocupación para una función en T(matriz entera). Cada elemento T[fila,butaca]  
almacena el código 1,2 o 3, para indicar:
1. Disponible 
2. Vendida
3. Vendida con Descuento.

Los datos N y M viene en la primer linea del archivo Teatro.TXT .
El precio de cada entrada es X y el descuento es del D%, ambos datos vienen
en la segunda línea del archivo.
Se pide leer la información y a partir de la matriz T de NxM, calcular e informar:
A) Cuantas filas registran al menos una butaca disponible.
B) Fila con importe máximo(obtenido de las butacas vendidas con y sin descuento).

N=4 M=5
X=500 D=20

  2	3 1 3 2
T=2 2 2 2 3
  2 1 2 2 1
  3 3 3 3 2

Respuestas:
A) 2 filas.
B) Fila 2(con $2400). }

Program Teatro;
Type
	TM = array[1..100,1..100] of integer;

Procedure LeerArchivo(Var T:TM;  Var N,M:byte; Var X,D:real);
Var
	i,j:byte;
	arch:text;
begin
	assign(arch,'Teatro.txt');reset(arch);
	readln(arch,N,M);
	readln(arch,X,D);
	For i:= 1 to N do
	begin
		For j:= 1 to M do
			read(arch,T[i,j]);
		readln(arch);
	end;
	close(arch);
end;

Function CuantasFilas(T:TM; N,M:byte):byte;
Var
	i,j,Cont:byte;
begin
	Cont:= 0;
	For i:= 1 to N do
	begin
		j:= 1;
		while (j <= M) and (T[i,j] <> 1) do
			j:= j + 1;
		
		If (j > M) then
			Cont:= Cont + 1;
	end;
	CuantasFilas:= Cont;
end;

Procedure MaximaFila(T:TM; N,M:byte; X,D:real);
Var
	i,j,PosMax:byte;
	Acum,Max,Desc:real;
begin
	Max:= 0;
	Desc:= (100 - D) /100;
	For i:= 1 to N do
	begin
		Acum:= 0;
		For j:= 1 to M do
		begin
			If (T[i,j] = 2) then
				Acum:= Acum + X 
			Else
				if (T[i,j] = 3) then
					Acum:= Acum + (X * Desc);
		end;
		
		If (Acum > Max) then
		begin	
			Max:= Acum;
			PosMax:= i;
		end;	
	end;
	writeln('B- Fila  ',PosMax,' tiene el importe maximo con $',Max:6:2);
end; 

Var
	T:TM;
	N,M:byte;
	X,D:real;
Begin
	LeerArchivo(T,N,M,X,D);
	writeln('A- Cantidad de filas con al menos una butaca disponible: ',CuantasFilas(T,N,M));
	writeln;
	writeln;
	MaximaFila(T,N,M,X,D);	
end.
