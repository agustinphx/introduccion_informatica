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

Procedure GenerarPromedio(Talles:TM; N,M:byte; Var VProm:TVR);
var
  i,j:byte;
  Sum,Prom: real;
begin
	For j:= 1 to M do
    begin
		Sum:=0;
		Prom:=0;
        For i:= 1 to N do
        begin
			Sum:= Sum + Talles[i,j];
        end;
        Prom:= (Sum / N);
        VProm[j]:= Prom;
      end;
end;

Procedure Imprime(VProm:TVR; N:byte);
Var
	i:byte;
begin
	For i:= 1 to N do
		write(VProm[i]:6:2,' ');
end;

Function Porcentaje(Talles:TM; N,M:byte):real;
Var
	i,j,Cont:byte;
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
	Porcentaje:= (Cont / M) * 100;
end;

Procedure Informa(Talles:TM; Cod:TV; N,M:byte);
Var
	X:string[4];
	i,j,Max,PosMax:byte;
begin
	write('Ingrese el codigo : ');readln(X);
	Max:= 0;
	i:= 1;
	while (i <= N ) and (Cod[i] <> X) do
		i:= i + 1;
		
    For j:= 1 to M do
		if (Talles[i,j] >= Max) then
		begin
			Max:= Talles[i,j];
			PosMax:= j;
		end;
		
	If (Max <> 0) then
		writeln('El mayor Stock esta en el talle: ', PosMax)
	Else
		writeln('No hay stock para ningun talle');
end;

Var
	Talles:TM;
	Cod:TV;
	VProm:TVR;
	N,M:byte;
	Porc:real;
Begin
	LeerArchivo(Talles,Cod,N,M);
	GenerarPromedio(Talles,N,M,VProm);
	Porc:= Porcentaje(Talles,N,M);
	write('A- ');
	writeln('El porcentaje de codigos con stock en todos los talles es del: ',Porc:6:2, ' %');
	writeln;
	writeln;
	writeln('C- Promedios: ');
	Imprime(VProm,N);
	writeln;
	writeln;
	write('B- ');
	Informa(Talles,Cod,N,M);
end.
