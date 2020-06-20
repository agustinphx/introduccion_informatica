{Un conjunto de corredores entrenan para una carrera, corriendo una hora cada uno
de los 7 días de la semana y teniendo como meta alcanzar en dicha hora, una mínima de
X kms.
En un archivo de texto se graba la meta X en la primera línea y en las restantes el nombre
(10 caracteres como máximo) y los 7 días de cada corredor, uno por línea.
20
bbb 5 10 15 19 9 5 0
hhh 2 30 6 9 10 30 9
ccc 1 5 30 15 8 20 25
aaa 5 10 0 20 40 25 15
Se pide desarrollar un programa Pascal, correctamente modularizado que lea y almacene
los nombres en un vector y los tramos en una matriz.
a.-Generar un arreglo con los nombres de los corredores que superaron la meta
establecida algún día de la semana. Imprimirlo
b.- Calcule e imprima, cuantos días no alcanzo la meta el corredor con promedio diario
máximo
Ejemplo N=4 Meta Semanal = 20
		   bbb 5 10 15 15 10 5 0   
		   hhh 10 20 5 10 10 30 5
		   ccc 5 5 10 1 10 15 25 
		   aaa 5 10 25 20 40 25 15
		  
Promedios: bbb 8.57	
	       hhh 12.85
	       ccc 10.14
	       aaa 20.00
	       
Respuestas:
a. ( hhh, ccc, aaa)
b. 3 días (4to corredor) }
Program TipoParcial2;
Type
	St3 = string[3];
	TM = array[1..100, 1..100] of byte;
	TV = array[1..10] of st3;

Procedure LeerArchivo(Var Kms:TM; Var Nombres:TV; Var Meta:byte; Var N,M:byte);
Var
	j:byte;
	arch:text;
begin
	N:= 0;
	M:= 7;
	assign(arch,'TipoParcial2.txt');reset(arch);
	readln(arch,Meta);
	while not eof (arch) do
	begin
		N:= N + 1;
		read(arch,Nombres[N]);
		For j:= 1 to M do 
		begin
			If (j <> M) then
				read(arch,Kms[N,j])
			Else
				readln(arch,Kms[N,j]);
		end;
	end;
	close(arch);
end;

Procedure GenerarArray(Kms:TM; Nombres:TV; N,M:byte; Meta:byte;  Var A:TV; Var K:byte);
Var
	i,j:byte;
begin
	K:= 0;
	For i:= 1 to N do
	begin
		j:= 1;
		while (j <= 7) and (Kms[i,j] < Meta) do
			j:= j + 1;
			
		If (j <= 7) then
		begin
			K:= K + 1;
			A[K]:= Nombres[i];
		end;
	end;
end;

Procedure Imprime(A:TV; K:byte);
Var
	i:byte;
begin
	For i:= 1 to K do
		write(A[i]:4);
end;

Function Suma(Kms:TM; Fila:byte):byte;
Var
	j,Sum:byte;
begin
	Sum:= 0;
	For j:= 1 to 7 do 
		Sum:= Sum + Kms[Fila,j];
	Suma:= Sum;
end;

Function PosicionMaximoPromedio(Kms:TM; N:byte):byte;
Var
	i,PosMax:byte;
	MaxProm,Prom:real;
begin
	MaxProm:= 0;
	PosMax:= 0;
	For i:= 1 to N do 
	begin
		Prom:= Suma(Kms,i)/ 7;
		If (Prom > MaxProm) then
		begin
			MaxProm:= Prom;
			PosMax:= i;
		end;
	end;
	PosicionMaximoPromedio:= PosMax;
end;

Function CantidadDias(Kms:TM; Fila:byte; Meta:real):byte;
Var
	j,Cant:byte;
begin
	Cant:= 0;
	For j:= 1 to 7 do
		If (Meta > Kms[Fila,j]) then
			Cant:= Cant + 1;
	CantidadDias:= Cant;
end;

Var
	Kms:TM;
	Nombres,A:TV;
	N,M,K,Meta,PosMax:byte;
Begin
	LeerArchivo(Kms,Nombres,Meta,N,M);
	GenerarArray(Kms,Nombres,N,M,Meta,A,K);
	write('A- Corredores que superaron la meta algun dia de la semana:');
	Imprime(A,K);
	writeln;
	writeln;
	PosMax:= PosicionMaximoPromedio(Kms,N);
	writeln('B- ',Nombres[PosMax], ' no alcanzo la meta en ',CantidadDias(Kms,PosMax,Meta),' dias');
end.
