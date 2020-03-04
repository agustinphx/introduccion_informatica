Program testunmdp;

Type
TV=array[1..100] of integer;
Matriz=array[1..10] of integer;

Procedure LeerArchivo(var Matriz:TM; var N,M:byte);
var i,j:integer; arch:text;
begin
	assign(arch,'testunmdp.txt');
	reset(arch);
	while not eof(arch) do
	begin
		readln(arch,N,M);
	end;
end;

Var
	N,M:byte;
	arch:text;
BEGIN
	LeerArchivo(arch,Matriz,N,M);
	
END.
