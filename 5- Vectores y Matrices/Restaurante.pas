{
























}

Program Restaurante;
Type
	St3 = string[3];
	TM = array[1..100,1..100] of real;
	TV = array[1..100] of St3;
	TVR = array[1..100] of real;
	
Procedure LeerArchivo(Var Mat:TM; Var V:TV; Var N,M:byte);
Var
	i,j:byte;
	arch:text;
begin
	assign(arch,'Restaurante.txt');reset(arch);
	readln(arch,N,M);
	For i:= 1 to N do
	begin
		read(arch,V[i]);
		For j:= 1 to M do
			read(arch,Mat[i,j]);
		readln(arch);
	end;
	close(arch);
end;

Function SumaFila(Mat:TM; N,M:byte):real; 
Var
	i,j:byte;
	Sum:real;
begin
	For i:= 1 to N do
		Sum:= 0;
		For j:= 1 to M do
			Sum:= Sum + Mat[i,j];
	SumaFila:= Sum;
end;

Function SumaTotal(Mat:TM; N,M:byte):real; 
Var
	i,j:byte;
	Sum:real;
begin
	Sum:= 0;
	For i:= 1 to N do
		For j:= 1 to M do
			Sum:= Sum + Mat[i,j];
	SumaTotal:= Sum;
end;

Procedure PorcentajePorFila(Mat:TM; V:TV; N,M:byte); 
Var
	i:byte;
	Porc,Recaudo:real;
begin
	For i:= 1 to  N do
	begin
		Porc:= (SumaFila(Mat,i,M) * 100) / SumaTotal(Mat,N,M);
		
		If (Porc >= 40) then
			Recaudo:= 50
		Else
			if (Porc >= 30) and (Porc < 40) then
				Recaudo:= 35
			Else
				if (Porc >= 15) and (Porc < 30) then
					Recaudo:= 18;
		
		writeln(V[i],'  $',Recaudo:6:2,'  recaudo el ',Porc:6:2,' %  sobre el total ');
	end;
end;

Procedure MaximoImporte(Mat:TM; V:TV; N,M:byte);
Var
	i,j,PosMax,Mesa:byte;
	Max:real;
begin
	Max:= 0;
	For i:= 1 to N do
		For j:= 1 to M do
		begin
			If (Mat[i,j] > Max) then
			begin
				Max:= Mat[i,j];
				PosMax:= i;
				Mesa:= j;
			end;
		end;
	writeln('B- Mesa ',Mesa,', mozo ',V[PosMax],' con $',Max:6:2);
end;

Function MesasAtendidas(Mat:TM; N,M:byte):byte;
Var
	i,Cant:byte;
begin
	Cant:= 0;
	i:= 1;
	while (i <= N) and (Mat[i,M] <> 0) do
		i:= i + 1;
	
	If (i <= N)	then
		Cant:= Cant + 1;
		
	MesasAtendidas:= Cant;
end;

Var
	Mat:TM;
	V:TV;
	N,M:byte;
Begin
	LeerArchivo(Mat,V,N,M);
	write('A- ');
	writeln;
	PorcentajePorFila(Mat,V,N,M);
	writeln;
	MaximoImporte(Mat,V,N,M);
	writeln;
	writeln('C- Mesas atendidas: ',MesasAtendidas(Mat,N,M));
End.
