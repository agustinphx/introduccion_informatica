{ Un conjunto de N ciclistas corrieron en M dias las cantidades de kms durante un tour internacional
N y M grabados en la primer linea del archivo:
4 5		   Kilometros por dia
Carlos   12.8 17.1 14.2 11.2 14.8
Eduardo  10.5 8.7 13.1 14 18.2 
Mauricio 17.3 22 19.8 16.3 13.9
Jorge    23.4 11.8 17.3 9.7 14.5
Se pide realizar un programa en pascal robusto,eficiente y correctamente modularizado que:
a- Calcule el promedio maximo entre todos los ciclistas.
b- Cantidad de kms que mas recorrio un ciclista en el dia 2.
c- Dado un ciclista X (ingresado por teclado), informar que dia recorrio menos kms (suponer único).
d- Porcentaje de ciclistas que obtuvieron un promedio mayor a 14.}

Program Ciclistass;
Type
	St8 = string[8];
	TM = array[1..100, 1..100] of real;
	TV = array[1..10] of St8;

Procedure LeerArchivo(Var Kms:TM; Var Ciclistas:TV; Var N,M:byte);
Var
	i,j:byte;
	arch:text;
begin
	assign(arch,'Ciclistas.txt');reset(arch);
	readln(arch,N,M);
	For i:= 1 to N do
	begin
		read(arch,Ciclistas[i]);
		For j:= 1 to M do
			read(arch,Kms[i,j]);
		readln(arch);
	end;
	close(arch);
end;

Function SumaFila(Kms:TM; N,M:byte):real;
Var
	j:byte;
	Sum:real;
begin
	Sum:= 0;
	For j:= 1 to M do
		Sum:= Sum + Kms[N,j];
	SumaFila:= Sum;
end;

Function MaximoPromedio(Kms:TM; N,M:byte):real;
Var
	i:byte;
	Prom,MaxProm:real;
begin
	MaxProm:= 0;
	For i:= 1 to N do  
	begin
		Prom:= SumaFila(Kms,i,M) / M;
		If (Prom > MaxProm) then
			MaxProm:= Prom;
	end;
	MaximoPromedio:= MaxProm;
end;

Function MasKms(Kms:TM; N,M:byte):real;
Var
	j,i:byte;
	Max:real;
begin
	Max:= 0;
	For i:= 1 to N do
		For j:= 1 to M do
			If (Kms[i,j] > Max) and (j = 2)  then
				Max:= Kms[i,j];
	MasKms:= Max;
end;

Function Promedio(Kms:TM; N,M:byte):real;
Var
	j:byte;
	Prom:real;
begin
	For j:= 1 to M do
		Prom:= SumaFila(Kms,N,j) / M;
	Promedio:= Prom;
end;

Function PorcentajeCiclistas(Kms:TM; N,M:byte):real;
Var
	i,j,Cont:byte;
	Prom:real;
begin
	Cont:= 0;
	For i:= 1 to N do
	begin
		Prom:= Promedio(Kms,i,M);
		For j:= 1 to M do
		begin
			If (Prom > 14) then
				Cont:= Cont + 1;
		end;
	end;
	PorcentajeCiclistas:= (Cont * 100) / (N*M);
end;


Procedure VerificaCiclista(Kms:TM; Ciclistas:TV; N,M:byte; X:St8);
Var
	i,j,Dia:byte;
	Min:real;
begin
	Min:= 999;	
	i:= 1;
	while (i <= N) and (Ciclistas[i] <> X) do
		i:= i + 1;
		
	For j:= 1 to M do
		If (Kms[i,j] < Min) then
		begin
			Min:= Kms[i,j];
			Dia:= j;
		end;
		
	If (i <= N) then
		writeln(X,'  menos kms ',Min:6:2,' dia ',Dia)
	Else
		writeln('El ciclista ingresado no existe');
end; 

Var
	Kms:TM;
	Ciclistas:TV;
	X:string;
	N,M:byte;
Begin
	LeerArchivo(Kms,Ciclistas,N,M);
	writeln('A- El promedio mas alto es: ',MaximoPromedio(Kms,N,M):6:2,' kms ');
	writeln;
	writeln('B- Mas kms recorridos en el dia 2: ',MasKms(Kms,N,M):6:2);
	writeln;
	writeln('D- Porcentaje de ciclistas con promedio mayor a 14 es: ',PorcentajeCiclistas(Kms,N,M):6:2,' %  ');
	writeln;
	write('Ingrese un ciclista: ');readln(X);
	write('C- ');
	VerificaCiclista(Kms,Ciclistas,N,M,X);
end.
