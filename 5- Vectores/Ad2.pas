{Dados dos archivos de números enteros positivos A1 (primos) y A2 (no primos).
Leer los números primos de A1 y almacenar en un arreglo VPrimo.
Leer los números de A2 (sin almacenar en un arreglo), determinar e informar para cada uno de ellos cuántos
divisores primos tiene en VPrimos. Recorrer una sola vez el archivo A2.
Ejemplo :
A1 VPrimo = (7, 2 , 5 , 11 , 3)
A2 = 10 105 50 22 30  10 tiene 2 divisores, 105 tiene 1 divisor……}
Program Ad2;
Type
	TV = array[1..100] of word;
	
Procedure LeerArchivoA1(Var VPrimo:TV;Var N:byte);
Var
	arch:text;
begin
	N:= 0;
	assign(arch,'A1.txt');reset(arch);
	while not eof (arch) do
	begin
		N:= N + 1;
		read(arch,VPrimo[N]);
	end;
	close(arch);
end;

Procedure LeerArchivoA2(VPrimo:TV; Var VNPrimo:TV; Var M:byte);
Var
	i:byte;
	arch:text;
begin
	M:= 0;
	assign(arch,'A2.txt');reset(arch);
	while not eof (arch) do
	begin
		M:= M + 1;
		read(arch,VNPrimo[M]);
	end;	
	close(arch);
end;

{Procedure Informa(VPrimo,VNPrimo:TV; N,M:byte);
Var
	i:byte;
begin
	For i:= 1 to N do
	begin
		For j:= 1 to M do
		begin
			If (VPrimo[i] MOD VNPrimo[N] = 0) then
				writeln(VNPrimo[N]:4);
		end;
	end;		
			 
end;}
Var
	VPrimo,VNPrimo:TV;
	N,M:byte;
Begin
	LeerArchivoA1(VPrimo,N);
	LeerArchivoA2(VPrimo,VNPrimo,M);
//	Informa(VPrimo,VNPrimo,N,M);
end.
