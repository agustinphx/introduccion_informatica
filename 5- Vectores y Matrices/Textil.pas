{En una empresa textil se registra la producción de N maquinas durante M dias. De cada maquina se conoce su
codigo identificatorio y el % de prendas falladas que produce.
Dicha informacion grabada en un archivo de texto, contiene en la 1ra linea N y M, y luego en cada una de las siguientes N lineas,
el codigo de maquina (3 caracteres) , el porcentaje de fallas que produce y a continuacion la cantidad de prendas (entera) producida en cada uno
de los M dias.

Archivo:
5 4
AB1  3  100 150 400 100
CD2  1  200 250 100 150
EF3  2  150 200 350 100
GH4  3  300 250 150 200
U5   1  300 200 100 400

Se pide leer y almacenar dicha información en estructuras adecuadas para luego informar:
a)De cada maquina el dia de maxima produccion
b)Que dia(1..M) se registro la mayor cantidad de prendas falladas
c)A partir de un codigo de maquina (ingresado por teclado) indicar su promedio diario

Respuestas: 
a) DiaMax 
	3 
	2 
	3 
	1 
	4

b) Cantidad prendas falladas
	20
	20.5
	25.5
	16.5
	
c)Codigo EF3 -> 200 }

Program Textil;
Type
	St3 = string[3];
	TV = array[1..100] of St3;
	TVR = array[1..100] of real;
	TM = array[1..100,1..100] of integer;
	TVConst = array[1..5] of St3;
	TVC = array[1..100] of byte;


Procedure LeerArchivo(Var Mat:TM; Var V:TV; Var V2:TVR; Var N,M:byte);
Var
	i,j:byte;
	arch:text;
begin
	assign(arch,'Textil.txt');reset(arch);
	readln(arch,N,M);
	For i:= 1 to N do
	begin
		read(arch,V[i],V2[i]);
		For j:= 1 to M do
			read(arch,Mat[i,j]);
		readln(arch);
	end;
	close(arch);
end;


Procedure Imprime(Mat:TM; VCod:TV; VFalla:TVR; N,M:byte); //Verificando que mi lea bien todo el archivo
Var
	i,j:byte;
begin
	For i:= 1 to N do
	begin
		write(VCod[i],VFalla[i]:6:2,' %  ');
		For j:= 1 to M do
			write(Mat[i,j]:4);
		writeln;
	end;
end;

Function PosMaxDia(Mat:TM; N,M:byte):byte; 
Var
	j,PosMax:byte;
	Max:integer;
begin
	Max:= 0;
	For j:= 1 to M do
		If (Mat[N,j] > Max) then
		begin
			Max:= Mat[N,j];
			PosMax:= j;
		end;
	PosMaxDia:= PosMax;
end;

Procedure GenerarArregloMaxDia(Mat:TM; N,M:byte; Var VDia:TVC);
Var
	i:byte;
begin
	For i:= 1 to N do
		VDia[i]:= PosMaxDia(Mat,i,M);
end;

Procedure ImprimeMaxDia(VDia:TVC; N:byte);
Var
	i:byte;
begin
	For i:= 1 to N do
		write(VDia[i]:4);
end;

Function CalculaFalla(Mat:TM; VFalla:TVR; N,M:byte):real; 
Var
	i,j:byte;
	Cal,Tot:real;
begin
	Tot:= 0;
	For i:= 1 to N do
	begin
		For j:= 1 to M do
			Cal:= (VFalla[i] /100) * Mat[i,j];
		Tot:= Tot + Cal;
	end;
	CalculaFalla:= Tot;
end;

Procedure GeneraArregloFalla(Mat:TM; VFalla:TVR; N,M:byte; Var VFalla2:TVR);
Var
	j:byte;
begin
	For j:= 1 to M do
		VFalla2[j]:= CalculaFalla(Mat,VFalla,N,j);
end;

Procedure ImprimeFalla(VFalla2:TVR; M:byte);
Var
	j:byte;
begin
	For j:= 1 to M do
		write(VFalla2[j]:6:2,' %   ');
end;

Function PromedioDiario(Mat:TM; N,M:byte):real; 
Var
	j:byte;
	Sum:integer;
begin
	Sum:= 0;
	For j:= 1 to M do
		Sum:= Sum + Mat[N,j];
     PromedioDiario:= Sum / M;
end;

function PromedioCodigo(Mat:TM; VCod:TV; N,M:byte; Cod:St3):real;
var
	i:byte;
begin
	i:= 1;
	while (i <= N) and (VCod[i] <> Cod) do
		i:= i + 1;  
		
	If (i<= N) then	
		PromedioCodigo:= PromedioDiario(Mat,i,M) //Debemos poner i en lugar de N para que lo calcule bien, si fuera para columnas j en lugar de M.
	Else
		PromedioCodigo:= 0;
end;

Var
	Mat:TM;
	VCod:TV;
	VFalla,VFalla2:TVR;
	VDia:TVC;
	Cod:St3;
	N,M:byte;
	Prom:real;
Begin
	LeerArchivo(Mat,VCod,VFalla,N,M);
	Imprime(Mat,VCod,VFalla,N,M);
	writeln;
	GenerarArregloMaxDia(Mat,N,M,VDia);
	write('A- ');
	ImprimeMaxDia(VDia,N);
	writeln;
	writeln;
	write('B- ');
	GeneraArregloFalla(Mat,VFalla,N,M,VFalla2);
	ImprimeFalla(VFalla2,M);
	writeln;
	writeln;
	write('Ingrese un codigo: ');readln(Cod);
	Prom:= PromedioCodigo(Mat,VCod,N,M,Cod);
	If (Prom > 0) then
		writeln('C- Para el codigo: ',Cod,' el promedio diario es: ',PromedioCodigo(Mat,VCod,N,M,Cod):2:0)
	Else
		writeln('No existe el codigo ingresado');
end.
