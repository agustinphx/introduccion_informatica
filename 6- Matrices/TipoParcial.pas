{Un conjunto de corredores entrenan para una carrera, corriendo una hora cada uno de los 7 días de la semana y teniendo como meta alcanzar en dicha hora,una mínima de X kms.
En un archivo de texto se graba la meta X en la primera linea y en las restantes el nombre(10 caracteres como máximo)y los 7 días de cada corredor,uno por línea.
 20
Ivo  5 10 15 15 10 5 0
Pia  10 20  5 10 10 30  5
Juan 5  5  10  1  8 20 25
Omar 5  10 25 20 40 25 15
Se pide desarrollar un programa Pascal, correctamente modularizado que lea y almacene los nombres en un vector y los tramos en una matriz.
A- Generar un arreglo con los nombres de los corredores que superaron la meta establecidad algún día de la semana. Imprimirlo.
B- Calcule e imprima, cuantos días no alcanzo la meta el corredor con promedio diario máximo.}
Program TipoParcial;
Type
	St10 = string[10];
	TM = array[1..20,1..7] of real;
	TV = array[1..20] of st10;

Procedure LeerArchivo(Var Mat:TM; Var V:TV; Var N:byte; Var X:real);
Var
	j:byte;
	arch:text;
begin
	N:= 0;
	assign(arch,'TipoParcial.txt');reset(arch);
	readln(arch,X);
	while not eof (arch) do
	begin
		N:= N + 1;
		read(arch,V[N]);
		For j:= 1 to 7 do //usamos j porque recorremos las columnas.
			read(arch,Mat[N,j]);
		readln(arch);
	end;
	close(arch);
end;

Procedure GenerarArray(Mat:TM;V:TV; N:byte; X:real;  Var B:TV; Var M:byte);
Var
	i,j:byte;
begin
	M:= 0;
	For i:= 1 to N do
	begin
		j:= 1;
		while (j <= 7) and (Mat[i,j] < X) do
			j:= j + 1;
			
		If (j <= 7) then
		begin
			M:= M + 1;
			B[M]:= V[i];
		end;
	end;
end;

Procedure Imprime(B:TV; M:byte);
Var
	i:byte;
begin
	For i:= 1 to M do
		write(B[i]);
end;

Function Suma(Mat:TM; Fila:byte):real;
Var
	j:byte;
	Sum:real;
begin
	Sum:= 0;
	For j:= 1 to 7 do 
		Sum:= Sum + Mat[Fila,j];
	Suma:= Sum;
end;

Function PosicionMaxProm(Mat:TM; N:byte):byte;
Var
	i,PosMax:byte;
	MaxProm,Prom:real;
begin
	MaxProm:= 0;
	PosMax:= 0;
	For i:= 1 to N do 
	begin
		Prom:= Suma(Mat,i)/ 7;
		If (Prom > MaxProm) then
		begin
			MaxProm:= Prom;
			PosMax:= i;
		end;
	end;
	PosicionMaxProm:= PosMax;
end;

Function CantidadDias(Mat:TM; Fila:byte; Meta:real):byte;
Var
	j,Cant:byte;
begin
	Cant:= 0;
	For j:= 1 to 7 do
		If (Meta > Mat[Fila,j]) then
			Cant:= Cant + 1;
	CantidadDias:= Cant;
end;
	
Var
	Mat:TM;
	V,B:TV;
	N,M,PosMax:byte;
	X:real;
begin
	LeerArchivo(Mat,V,N,X);
	GenerarArray(Mat,V,N,X,B,M);
	write('A- ');
	Imprime(B,M);
	writeln;
	PosMax:= PosicionMaxProm(Mat,N);
	writeln;
	writeln('B- ',V[PosMax], ' no alcanzo la meta en ' ,CantidadDias(Mat,PosMax,X), ' dias');
end.
