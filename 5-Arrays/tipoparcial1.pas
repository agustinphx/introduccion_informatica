Program tipoparcial;
Type
	TV=array[1..100] of integer;
	TM=array[1..100,1..100] of integer;
	TR=array[1..100] of real;
Var
	matriz: TM;
	vector,VFila: TV;
	VProm: TR;
	K,N,M:byte;
	
Procedure LeerArchivo(var matriz:TM; var vector:TV; var N,M:byte);
Var 
	arch:text; 
	i,j:byte;
begin
assign(arch,'tipoparcial1.txt');reset(arch);
read(arch,N); readln(arch,M);
For i:= 1 to N do
	begin
		For j:= 1 to M do
			read(arch,matriz[i,j]);
	    readln(arch,vector[i]);
	end;
	close(arch);

end;

Function Promedio(matriz:TM; vector:TV; N,M:byte):real;
var 
	i:byte; 
	divisor,suma:integer;
Begin 
suma:= 0; divisor := 0;
For i:= 1 to M do
Begin
	If ((matriz[N,i] mod vector[N]) = 0) then
	Begin
		divisor := divisor + 1;
		suma:= suma + matriz[N,i];
	end;
end;
If suma > 0 then
	Promedio := suma / divisor
Else
	Promedio:= 0;
end;
	
Function BusquedaPromedio(VProm: TR; N:byte; promedio: real):boolean;
Var
	i: byte;
Begin
	i:=0;
	while(promedio <> VProm[i]) and (i <= N) do
		i:= i+1;
	BusquedaPromedio:= (i<=N);	
end;
	
Procedure generarArreglos(matriz:TM; vector:TV; N,M:byte; var k:byte; var VProm:TR; var VFila:TV);
VAR
	i:byte;
	prom: real;
Begin
	prom:= 0;
	k:=0;
For i:= 1 to N do
	Begin
		prom:= Promedio(matriz,vector,i,M);
		If(BusquedaPromedio(VProm,K,prom) = false) and ( prom <> 0) then
			begin
				k:=k+1;
				VProm[k]:= prom;
				VFila[k]:= i;
			end;
	end;
end;	

Procedure imprime(VProm:TR; VFila:TV; K:byte);
var 
	i:byte;
begin
	For i:= 1 to K do
		write(' ',VProm[i]:8:2);
	
	writeln();
	for i:=1 to K do
		write(' ',VFila[i]);
end;
	
Begin
	LeerArchivo(matriz, vector, N,M);
	Promedio(matriz,vector,N,M);
	generarArreglos(matriz,vector,N,M,K,VProm,VFila);
	imprime(VProm,VFila,K);
end.
