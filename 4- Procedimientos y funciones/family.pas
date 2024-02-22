Program text1;
Type
st14 = string[14];
TV = array[1..100] of st14;
TVnum = array[1..100] of byte;
Var
	Nombre:TV;
	num:TVnum;
	N,M:byte;

Procedure LeerArchivo(var Nombre:TV; var num:TVnum; var N,M:byte);
var
	i,j:byte; 
	arch:text;
Begin
	assign(arch,'family.txt'); reset(arch);
	readln(arch,N);
	For i:= 1 to N do
	begin
		readln(arch,Nombre[i]);
		writeln(Nombre[i]);
	end;
	
	For j:= 1 to M do
	begin
		readln(arch,num[i]);
		writeln(num[i]);
	end;
	close(arch);
end;

Begin
	LeerArchivo(Nombre,num,N,M);
end.
