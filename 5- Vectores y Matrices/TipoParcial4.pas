{En un torneo de natación con N nadadores se clasifican aquellos que superan el minimo establecido antes de ir a la competencia final en base a la cantidad de piletas que lograron completar durante M dias que fueron al natatorio a lo largo del mes.
En un archivo de texto se graba en la primera linea el mínimo de cantidad de piletas que deben alcanzar los nadadores durante al menos 5 dias para clasificar, en la segunda la cantidad de dias y  en las restantes el nombre(10 caracteres como máximo)y lo cantidad de piletas que nadaron,una por línea.
31
20
Marcelo     25 10 15 15 20 13 17 23 17 16 21 33 28 24 27 21 19 21 17 24
Santiago    11 10 18 12 17 15 19 21 18 14 16 13 18 17 23 18 21 25 26 27
Oscar       19 26 18 24 18 20 25 23 21 26 31 29 27 25 22 24 19 17 21 22
Eugenia     16 15 19 25 20 27 29 32 31 30 34 35 27 21 26 22 18 23 24 26  
Sebastian   30 26 28 31 20 19 22 17 16 19 21 25 18 26 11 14 17 13 15 16
Camila      25 28 26 27 24 29 30 31 29 33 28 34 38 41 36 33 31 28 29 32
Maria       21 26 29 29 28 27 33 36 38 41 39 27 33 37 29 27 26 28 29 37
Federico    17 21 26 24 18 17 19 21 22 26 27 21 25 24 21 20 19 18 23 26

Se pide desarrollar un programa Pascal, correctamente modularizado que lea y almacene los nombres en un vector y los tramos en una matriz.
A- Generar un arreglo con los nombres de los nadadores que cumplieron con el mínimo establecido(superar 31 piletas completadas durante al menos 5 días).
B- Informar cuantos nadadores alcanzaron superar la barrera de las 40 piletas completadas.
C- Nombre del nadador que menos piletas alcanzó completar en un dia junto con la cantidad de piletas.
D- Informar el promedio mas alto entre todos los nadadores  junto con su nombre.
Salidas:
A Camila Maria Federico
B 2 (Camila y Maria)
C Marcelo 10 piletas
D Maria(promedio 31)}
Program TipoParcial4;
Type
	St10 = string[10];
	TM = array[1..100,1..100] of word;
	TV = array[1..100] of St10;
	
Procedure LeerArchivo(Var Mat:TM; Var Vec:TV; Var N,M:byte; Var Min:byte);
Var
	j:byte;
	arch:text;
begin
	N:= 0;
	assign(arch,'TipoParcial4.txt');reset(arch);
	readln(arch,Min);
	readln(arch,M);
	while not eof (arch) do
	begin
		N:= N + 1;
		read(arch,Vec[N]);
		For j:= 1 to M do
			read(arch,Mat[N,j]);
		readln(arch);
	end;
	close(arch);
end;

Procedure GenerarArray(Mat:TM; Vec:TV; N,M,Min:byte; Var A:TV; Var K:byte); // Array NO paralelo.
Var
	i,j,Cont:byte;
begin
	K:= 0;
	Cont:= 0;
	For i:= 1 to N do
	begin
		For j:= 1 to M do
		begin
			If (Mat[i,j] > Min) then
				Cont:= Cont + 1;
		end;
		
		If (Cont >= 5) then
		begin
			K:= K + 1;
			A[K]:= Vec[i];
		end;	
	end;
end;

Procedure Imprime(A:TV; K:byte);
Var
	i:byte;
begin
	write('A- Nadadores que superaron el minimo establecido: ');
	For i:= 1 to K do
		write(A[i]);
end;

Function CantidadNadadores(Mat:TM; N,M:byte):byte;
Var
	i,j,Cont:byte;
begin
	Cont:= 0;
	For i:= 1 to N do
		For j:= 1 to M do
		begin
			If (Mat[i,j] > 40) then
				Cont:= Cont + 1;
		end;
	CantidadNadadores:= Cont;
end;

Procedure MenosPiletas(Mat:TM; Vec:TV; N,M:byte);
Var
	Nom:string[10];
	i,j,Min:byte;
begin
	Min:= Mat[1,1];
	For i:= 1 to N do
		For j:= 1 to M do
		begin
			If (Min > Mat[i,j]) then
			begin
				Min:= Mat[i,j];
				Nom:= Vec[i];
			end;
		end;
	writeln('C- El nadador que menos piletas completo es:  ',Nom,' con ',Min,' piletas');
end;

Function Suma(Mat:TM; Fila:byte):word;
Var
	j:byte;
	Sum:word;
begin
	Sum:= 0;
	For j:= 1 to 20 do 
		Sum:= Sum + Mat[Fila,j];
	Suma:= Sum;
end;

Procedure MaximoPromedio(Mat:TM; Vec:TV; N,M:byte);
Var
	i,PosMax:byte;
	MaxProm,Prom:real;
begin
	MaxProm:= 0;
	PosMax:= 0;
	For i:= 1 to N do 
	begin
		Prom:= Suma(Mat,i)/ M;
		If (Prom > MaxProm) then
		begin
			MaxProm:= Prom;
			PosMax:= i;
		end;
	end;
	writeln('D-  ',Vec[PosMax],' tiene el maximo promedio con ',MaxProm:2:0,' piletas completadas');
end;

Var
	Mat:TM;
	Vec,A:TV;
	N,M,Min,K:byte;
Begin
	LeerArchivo(Mat,Vec,N,M,Min);
	GenerarArray(Mat,Vec,N,M,Min,A,K);
	Imprime(A,K);
	writeln;
	writeln;
	writeln('B- Cantidad de nadadores que superaron  40 piletas en un dia: ',CantidadNadadores(Mat,N,M));
	writeln;
	MenosPiletas(Mat,Vec,N,M);
	writeln;
	MaximoPromedio(Mat,Vec,N,M);
end.
