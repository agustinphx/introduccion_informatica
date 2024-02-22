{Una dietética ofrece varios tipos distintos de mezcla de M ingredientes (semillas/frutos). Esta
información está almacenada en una matriz MEZCLA donde:
MEZCLA [ i , j ] = p , siendo p el porcentaje del ingrediente j en la
mezcla i
Se pide ingresar la información y además:
a) Calcular el porcentaje de mezclas que contienen todos los
ingredientes respecto del total de mezclas.
b) Dado un ingrediente X (ingresado por teclado), informar cuál es
la mezcla que contiene el mayor porcentaje de dicho ingrediente
(suponer único).
c) Generar un arreglo con la cantidad de mezclas donde cada
ingredientes aparece con una concentración mayor a Y (donde Y es un % ingresado por
teclado) .
*Respuestas:
a) 40% (mezclas Energética y Dietética)
b) X= 4  La Mezcla “Natural” (con 60 %)
c) Y= 29  ( 2, 2, 3, 1)}
Program Practica2;
Type
	St12 = string[12];
	TM = array[1..100,1..100] of real; //matriz de porcentajes.
	TV = array[1..5] of St12;
	TVC = array[1..100] of word;

Procedure LeerArchivo(Var Ingredientes:TM; Var Mezclas:TV; Var N,M:byte);
Var
	j:byte;
	arch:text;
begin
	N:= 0;
	assign(arch,'Practica2.txt');reset(arch);
	readln(arch,M);
	while not eof (arch) do
	begin
		N:= N + 1;
		read(arch,Mezclas[N]);
		For j:= 1 to M do
			read(arch,Ingredientes[N,j]);
		readln(arch);
	end;
	close(arch);
end;

Procedure ImprimeArchivo(Ingredientes:TM; Mezclas:TV; N,M:byte);
Var
	i,j:byte;
begin
	For i:= 1 to N do
	begin
		write(Mezclas[i]);
		For j:= 1 to M do
			write(Ingredientes[i,j]:6:2,' %  ');
		writeln;
	end;
end;

Function Porcentaje(Ingredientes:TM; N,M:byte):real;
Var
	i,j,Cont:byte;
begin
	Cont:= 0;
	For i:= 1 to N do
	begin
		j:= 1;
		while (j <= M) and (Ingredientes[i,j] <> 0) do
			j:= j + 1;
			
		If (j > M) then
			Cont:= Cont + 1;
	end;
	Porcentaje:= (Cont / N) * 100;
end; 

Procedure VerificaIngrediente(Ingredientes:TM; Mezclas:TV; N,M,X:byte);
Var
	i,j,PosMax:byte;
	Max:real;
begin
	Max:= 0;
	j:= 1;
	while (j <= M) and (X <> j) do
		j:= j + 1;

	For i:= 1 to N do
		If (Ingredientes[i,j] > Max) then
		begin
			Max:= Ingredientes[i,j];
			PosMax:= i;
		end;
		
	If (j <= M) then
		writeln('Mezcla ',Mezclas[PosMax],' con ',Max:6:2,' %  ')
	Else
		writeln('No existe el ingrediente ingresado');
	
end;

Function CantidadMezclas(Ingredientes:TM; N,M:byte; Y:real):byte;
Var
	i,Cant:byte;
begin
	Cant:= 0;
	For i:= 1 to N do
		If (Ingredientes[i,M] > Y) then
			Cant:= Cant + 1;
	CantidadMezclas:= Cant;
end;

Procedure GenerarArreglo(Ingredientes:TM; N,M:byte; Y:real; Var VCant:TVC);
Var
	j:byte;
begin
	For j:= 1 to M do
		VCant[j]:= CantidadMezclas(Ingredientes,N,j,Y);

end;

Procedure ImprimeArreglo(VCant:TVC; M:byte);
Var
	j:byte;
begin
	For j:= 1 to M do
		write(VCant[j]:4);
end;

Var
	Ingredientes:TM;
	Mezclas:TV;
	VCant:TVC;
	N,M,X:byte;
	Y:real;
Begin
	LeerArchivo(Ingredientes,Mezclas,N,M);
	ImprimeArchivo(Ingredientes,Mezclas,N,M);
	writeln;
	writeln('A- El porcentaje de mezclas que contienen todos los ingredientes es del : ',Porcentaje(Ingredientes,N,M):2:0,' %');
	writeln;
	write('Ingrese un ingrediente: ');readln(X);
	write('B- ');
	VerificaIngrediente(Ingredientes,Mezclas,N,M,X);
	writeln;
	write('Ingrese una concentracion: ');readln(Y);
	GenerarArreglo(Ingredientes,N,M,Y,VCant);
	write('C -');
	ImprimeArreglo(VCant,M);
end.
