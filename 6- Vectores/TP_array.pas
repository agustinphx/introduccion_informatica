{Dado un archivo de enteros, leerlos en un arreglo A, obtener el promedio de
todos los números divisores del máximo y con ellos armar otro arreglo B.
Mostrar ambos arreglos.
Ejemplo:
Archivo : 5 7 1 12 15 -8 10 2 25 26 50 13
A= (5, 7, 1, 12, 15, -8, 10, 2, 25, 26, 50, 13)
Maximo = 50 Prom=15.5 B=( 5, 1, 10, 2, 25, 50 )}

Program TP_array;
Type
	TV = array[1..12] of integer;

Procedure LeerArchivo(Var A:TV; Var N:byte);
Var
	arch:text;
begin
	N:= 0;
	assign(arch,'TP_array.txt');reset(arch);
	while not eof (arch) do
	begin
		N:= N + 1;
		readln(arch,A[N]);
	end;
	close(arch);
end;

Procedure GenerarArray(A:TV; N:byte; Var B:TV; Var M:byte);
Var
	i:byte;
begin	
	M:= 0;
	For i:= 1 to N do
	begin
		If (50 MOD A[i] = 0) then
		begin
			M:= M + 1;
			B[M]:= A[i];
		end;		
	end;
end;

Function Promedio(B:TV; M:byte):real;
Var
	i,Cont:byte;
	Suma:integer;
begin
	Suma:= 0;
	Cont:= 0;
	For i:= 1 to M do
	begin
		Suma:= Suma + B[i];
		Cont:= Cont + 1;
	end;
	Promedio:= Suma / Cont;
end;

Procedure ImprimeArrayA(A:TV; N:byte);
Var
	i:byte;
begin
	writeln('Vector A');
	For i:= 1 to N do
		write(A[i],' ');
end;

Procedure ImprimeArrayB(B:TV; M:byte);
Var
	i:byte;
begin
	writeln;
	writeln;
	writeln('Vector B');
	For i:= 1 to M do
		write(B[i],' ');
	writeln;
	writeln;
	writeln('El promedio de los divisores del maximo es: ',Promedio(B,M):2:1);	
end;

Var
	A,B:TV;
	N,M:byte;
Begin
	LeerArchivo(A,N);
	GenerarArray(A,N,B,M);
	ImprimeArrayA(A,N);
	ImprimeArrayB(B,M);
end.
