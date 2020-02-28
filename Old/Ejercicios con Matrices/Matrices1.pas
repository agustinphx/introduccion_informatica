Program matrices1;
type
TV=array[1..100] of integer;
TM=array[1..100,1..100] of integer;

Procedure LeerArchivo(var matriz:TM; var N,M:byte);
var i,j:byte; arch:text;
begin
assign(arch,'ejeMatriz.txt');reset(arch);
If not eof(arch) then
	begin
	read(arch,N);
	readln(arch,M);
	For i:=1 to N do
		begin
		For j:= 1 to M do
			read(arch,matriz[i,j]);
			readln(arch); //salto de linea
		end;
	end;
	close(arch);
end;

Function repite(matriz:TM; N,M:byte; num:integer):byte;
var i,j:byte; cont:byte;
begin
cont:=0;
For i:= 1 to N do
begin	
	For j:= 1 to M do
	begin
	If(num = matriz[i,j]) then
	cont:=cont + 1;
	end;
	repite:=cont;
end;
end;



Procedure elementos(matriz:TM; N,M:byte; var nulos,p,neg:byte);
var i,j:byte; 
begin
nulos:=0;
p:=0;
neg:=0;
For i:= 1 to N do
	begin
		For j:= 1 to M do
		begin
		If (matriz[i,j] > 0) then
			p:= p + 1
		Else
			If(matriz[i,j] < 0 ) then
			neg:= neg + 1
			Else 
				nulos:= nulos + 1;
		end;
	end;
end;


Procedure intercambio(var matriz:TM; N,M:byte; H,K:byte);
var j:byte; aux:integer;
begin
	For j:= 1 to M  do 
	begin
		aux:=matriz[H,j];
		matriz[H,j]:=matriz[K,j];
		matriz[K,j]:=aux;
	end;
end;

Procedure mostrar(matriz:TM; N,M:byte);
var i,j:byte; 
begin
For i:= 1 to N do
	begin
		For j:= 1 to M do
		write('[',matriz[i,j],']');
		writeln('');
	end;
	
end;





var N,M:byte;
	matriz:TM;
	num:integer;
	nulos,p,neg:byte;
	
Begin
	
	num:=4 ;
	LeerArchivo(matriz,N,M);
	writeln('el numero se repite ' ,repite(matriz,N,M,num));
	elementos(matriz,N,M,nulos,p,neg);
	write(nulos,p,neg);
	intercambio(matriz,N,M,1,2);
	writeln();
	mostrar(matriz,N,M);
end.






















	
