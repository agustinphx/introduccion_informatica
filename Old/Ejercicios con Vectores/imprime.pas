Program vectores;
Type
	TV=Array[1..5] of word;
Var
	A:TV;
	N:byte;
Procedure imprime(A:TV; N:byte);
var i:byte;
Begin
	i:=0;
	while(i< N) do
	begin
		i:=i+1;
		write(A[i]);
	end;
end;

Procedure LeeVector(var A:TV; Var N:byte);
var arch:text; i:byte;
begin
	i:=0;
	assign(arch,'imprime.txt');
	reset(arch);
	while not eof(arch) do
	begin
		i:=i+1;
		read(arch,A[i]);
	end;
		close(arch);
		N:=i;
	end;
Begin
	LeeVector(A,N);
	imprime(A,N);
end.
