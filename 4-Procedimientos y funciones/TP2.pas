// TP2
Program TP2;
Type
TV=array[1..100] of integer;

Procedure insertarOrdenado(var A:TV; N,B:integer);
var 
	i:byte;
begin  ///Ordenado por inserccion
	i:=N;
	while (i>0) and (B < A[i]) do
	begin
		A[i+1] := A[i];
		i := i-1;
	end;
		A[i+1] := B;
end;


Procedure LeerArchivo(var A:TV; var N:byte);
var
	i,B:integer;  arch:text;
begin
	i:=0;
	assign(arch,'TP2.txt');
	reset(arch);
	while not eof(arch) do
	begin
		 readln(arch,B);
		 if (i>0) and (B > A[i]) then
		 begin
			i:= i+1;
			A[i]:=B;
		end;
		Else
			if (i=0) then
			begin
				i:= i+1;
				A[i]:=B;
			end;
	end;
	N:=i;
	close(arch);
	end;
	
procedure MochilaPerfecta(A:TV; N:byte);
var 
	i:byte; sum:word; 
begin
	i:=1;
	sum:=0;
	while (i<=N) and (sum < A[i]) do
	begin
		sum:=sum+A[i];
		i:=i+1;
	end;
	
	if (i<=N) then
		writeln('EL primer elemento que no cumple es ',A[i])
	else
		writeln('La mochila es perfecta');
		
end;

Var
	A:TV;
	N:byte;
BEGIN
	LeerArchivo(A,N);
	MochilaPerfecta(A,N);	
END.



