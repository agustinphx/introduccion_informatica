{En la provincia de Buenos Aires se llevan a cabo N obras viales, cada una de ellas planificada en M tramos, no concluidos
aun (M igual para todas ellas).
Se conoce de cada empresa su nombre (cadena de 4 caracteres) y la cantidad tramos concluidos(menor que M y diferente para cada empresa)
y además la extensión en kms de cada uno de ellos (concluido o pendiente).
N = 4 M = 5
XXXX 2 50 40 60 80 50
BBBB 3 20 30 50 100 150
ZZZZ 4 40 60 70 90 80
TTTT 2 100 160 80 50 20

Se pide ingresar de un archivo de texto la información descripta para calcular e informar:
a)Nombre de la empresa con mayor extensión pendiente.
b)Para cada empresa listar su nombre y el % de extensión realizada con respecto al total de la obra.
c)Para un número de tramo dado, verificar si todas lo han concluido en dicho caso sumar todos los kms.

Respuestas:
a) BBBB 250
b) 90 * 100 / 280 = 32.14 %
   100 * 100 / 350 = 28.57%
   260 * 100 /340 = 76.47%
   260 * 100 / 410 = 63.41%

c) Tramo = 2 -> 40 + 30 +60 + 160 = 290
   Tramo = 3 -> No todas las empresas concluyeron con dicho tramo.
}
Program ObrasViales;
Type
	St4 = string[4];
	TM = array[1..100,1..100] of word;
	TV = array[1..100] of St4;
	TVC = array[1..100] of word;
	TVR = array[1..100] of real;
	
Procedure LeerArchivo(Var Mat:TM; Var V:TV; Var VC:TVC; Var N,M:byte);
Var
	i,j:byte;
	arch:text;
begin
	assign(arch,'ObrasViales.txt');reset(arch);
	readln(arch,N,M);
	For i:= 1 to N do
	begin
		read(arch,V[i],VC[i]);
		For j:= 1 to M do
			read(arch,Mat[i,j]);
		readln(arch);
	end;
	close(arch);
end;

Procedure ImprimeArchivo(Mat:TM; V:TV; VC:TVC; N,M:byte);
Var
	i,j:byte;
begin
	For i:= 1 to N do
	begin
		write(V[i],'   ',VC[i]);
		For j:= 1 to M do
			write(Mat[i,j]:4);
		writeln;
	end;
end;

Procedure TramoPendiente(Mat:TM; V:TV; VC:TVC; N,M:byte);
Var
	i,j,PosMax:byte;
	Max,Sum:word;
begin
	Max:= 0;
	For i:= 1 to N do
	begin
		Sum:= 0;
		For j:= 1 to M do
		begin
			If (VC[i] < j) then
				Sum:= Sum + Mat[i,j]
		end;
		
		If (Sum > Max) then
		begin
			Max:= Sum;
			PosMax:= i;
		end;
	end;
	writeln('A- La empresa con mayor tramo pendiente es: ',V[PosMax],' con ',Max);
end;

Function SumaTramo(Mat:TM; V:TV; VC:TVC; N,M:byte):word;
Var
	j:byte;
	SumT:word;
begin
	SumT:= 0;
	For j:= 1 to M do
	begin
		If (VC[N] >= j) then
			SumT:= SumT + Mat[N,j]
	end;
	SumaTramo:= SumT;
end;

Function TotalEmpresa(Mat:TM; N,M:byte):word; // Esta OK
Var
	i,j:byte;
	Acum:word;
begin
	For i:= 1 to N do
	begin
		Acum:= 0;
		For j:= 1 to M do
			Acum:= Acum + Mat[i,j];
	end;
	TotalEmpresa:= Acum;
end;

Procedure PorcentajePorFila(Mat:TM; V:TV; VC:TVC; N,M:byte; Var VPorc:TVR);
Var
	i:byte;
begin
	For i:= 1 to N do
	begin
		VPorc[i]:= SumaTramo(Mat,V,VC,i,M) * 100 / TotalEmpresa(Mat,i,M);
		writeln(V[i],'   ',VPorc[i]:6:2,' %  ');
	end;
end;

Procedure VerificaTramo(Mat:TM; V:TV; VC:TVC; N,M,Tramo:byte);
Var
	i:byte;
	SumT:word;
begin
	SumT:= 0;
	For i:= 1 to N do 
	begin
		If (Tramo <= 2) then
			SumT:= SumT + Mat[i,Tramo];
	end;
	
 	If (SumT > 0) then
		writeln('Tramo ',Tramo,' suma ',SumT,' tramos concluidos')
	Else
		writeln('No todas las empresas concluyeron el tramo'); 
end;

Var
	Mat:TM;
	V:TV;
	VC:TVC;
	VPorc:TVR;
	N,M,Tramo:byte;
Begin
	LeerArchivo(Mat,V,VC,N,M);
	ImprimeArchivo(Mat,V,VC,N,M);
	writeln;
	TramoPendiente(Mat,V,VC,N,M);
	writeln;
	writeln('B- ');
	PorcentajePorFila(Mat,V,VC,N,M,VPorc);
	writeln;
	writeln;
	write('Ingrese un tramo (1 al 5) : ');readln(Tramo);
	write('C- ');
	VerificaTramo(Mat,V,VC,N,M,Tramo);
End.
