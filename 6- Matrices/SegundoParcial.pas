{Una fábrica Textil ofrece N tipos distintos de prendas de M talles (1..M). Esta información se
encuentra en un archivo STOCK.TXT donde en la primer línea viene M (cantidad de talles) y
luego:
✔ Código de prenda (alfanumérico de 4)
✔ Cantidad de prendas de los M talles
5 5
AA12 20 0 10 12 8
BB34 10 13 25 30 15
CC56 0 22 14 16 20
DD78 13 18 33 0 17
EE90 7 15 8 22 15
Se pide ingresar la información y además:
a) Calcular el porcentaje de códigos que tienen stock de todos los
talles sobre el total códigos.
b) Dado un Código X (ingresado por teclado), informar cuál talle con mayor cantidad de
prendas (suponer único), puede no existir.
c) Generar un arreglo con el promedio de prendas por talle.}
Program Parcial;
Type
	St4 = string[4];
	TM = array[1..100,1..100] of byte;
	TV = array[1..100] of St4;
	TVR = array[1..100] of real;
	
Procedure LeerArchivo(Var Talles:TM; Var Cod:TV; Var N,M:byte);
Var
	i,j:byte;
	arch:text;
begin
	N:= 0;
	assign(arch,'SegundoParcial.txt');reset(arch);
	readln(arch,N,M);
	For i:= 1 to N do
	begin
		read(arch,Cod[i]);
		For j:= 1 to M do
			read(arch,Talles[i,j]);
		readln(arch);
	end;
	close(arch);
end;

Function Promedio(Talles:TM; Fila,Columnas:byte):real;
Var
	i:byte;
	Sum,Cont:integer;
begin
	Sum:= 0;
	Cont:= 0;
	For i:= 1 to Columnas do
	begin
		Sum:= Sum + Talles[Fila,i];
		Cont:= Cont + 1;
	end;
	Promedio:= Sum / Cont;
end;

Procedure GenerarArray(Talles:TM; Cod:TV; N,M:byte; Var VProm:TVR; Var K:byte);
Var
	i:byte;
	Prom:real;
begin
	K:= 0;
	For i:= 1 to N do
	begin
	 	Prom:= Promedio(Talles,i,M);
		If (Prom <> 0) then
		begin
			K:= K + 1;
			VProm[K]:= Prom;
		end;
	end;
end;

Procedure Imprime(VProm:TVR; K:byte);
Var
	i:byte;
begin
	For i:= 1 to K do
		write(VProm[i]:6:2,' ');
end;

Procedure Porcentaje(Talles:TM; N,M:byte);
Var
	i,j,Cont:byte;
	Porc:real;
begin
	Cont:= 0;
	For i:= 1 to N do
	begin
		j:= 1;
		while (j <= M) and (Talles[i,j] <> 0) do
			j:= j + 1;
			
		If (j >= M) then
			Cont:= Cont + 1;
	end;
	Porc:= (Cont / M) * 100;
	writeln('El porcentaje de codigos con stock en todos los talles es del: ',Porc:2:0, '%');
end;

Function MayorTalle(Talles:TM; N,M:byte):byte;
Var
	i,j,Max:byte;
begin
	Max:= Talles[1,1];
	For j:= 1 to M do 
		For i:= 1 to N do
		begin
			If(Talles[i,j] > Max) then
				Max:= Talles[i,j];
		end;
	MayorTalle:= Max;
end;


Procedure Informa(Talles:TM; Cod:TV; N,M:byte);
Var
	Encontrado,j,X,Max:byte;
begin
	Encontrado:= 0;
	Max:= MayorTalle(Talles,N,M);
	write('Ingrese un numero del 1 al ',N,' : ');readln(X);
	For j:= 1 to M do
		If (Talles[X,j] = Max) then
			Encontrado:= 1;
			
	If (Encontrado = 1) then
		writeln(Cod[x],': Es el codigo con mas stock en talles')
	Else
		writeln(Cod[x],': No es el codigo con mas stock de talles');
end;

Var
	Talles:TM;
	Cod:TV;
	VProm:TVR;
	N,M,K:byte;
Begin
	LeerArchivo(Talles,Cod,N,M);
	GenerarArray(Talles,Cod,N,M,VProm,K);
	write('A- ');
	Porcentaje(Talles,N,M);
	writeln;
	MayorTalle(Talles,N,M);
	writeln;
	writeln('C- Promedios: ');
	Imprime(VProm,K);
	writeln;
	writeln;
	writeln('B- ');
	Informa(Talles,Cod,N,M);
end.
