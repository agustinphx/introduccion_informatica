{ Escribir un programa Pascal eficiente y correctamente modularizado que resuelva el siguiente problema: Se
dice que un vector V de N números enteros es una mochila perfecta si cada elemento del vector es mayor que la
suma de todos los anteriores.
Dado un archivo de números enteros no nulos, leerlos almacenando en un arreglo V aquellos que sean
ascendentes. Luego, determinar si V es o no una mochila perfecta. En caso de no ser indicar cuál es el primer
elemento que no cumple.
 Ejemplos :
• Archivo = 2 1 5 -10 3 9 18 4 60  V = ( 2 , 5 , 9 , 18 , 60 ) es una mochila perfecta
• Archivo = 1 5 -10 3 7 4 10 45  V = ( 1 , 5 , 7 , 10 , 45 ) no es una mochila perfecta }
Program Ad3;
Type
	TV = array[1..100] of integer;

Procedure LeerArchivo(var V:TV; var N:byte);
var
	i,B:integer;  
	arch:text;
begin
	i:=0;
	assign(arch,'Ad3.txt');reset(arch);
	while not eof (arch) do
	begin
		readln(arch,B);
		If (i > 0) and (B > V[i]) then
		begin
			i:= i + 1;
			V[i]:= B;
		end
		else
			if (i = 0) then
			begin
				i:= i + 1;
				V[i]:= B;
			end;
	end;
	N:=i;
	close(arch);
end;
		
Procedure insertarOrdenado(var V:TV; N,B:integer);
var 
	i:byte;
begin 
	i:= N;
	while (i > 0) and (B < V[i]) do
	begin
		V[i + 1]:= V[i];
		i:= i - 1;
	end;
	V[i + 1]:= B;
end;

Procedure MochilaPerfecta(V:TV; N:byte);
var 
	i:byte; 
	Sum:word; 
begin
	i:= 1;
	Sum:= 0;
	while (i <= N) and (Sum < V[i]) do
	begin
		Sum:= Sum + V[i];
		i:= i + 1;
	end;
	
	If (i <= N) then
		writeln('   no es una mochila perfecta, el primer elemento que no cumple es ',V[i])
	else
		writeln('   es una mochila es perfecta');
end;

Procedure Imprime(V:TV; N:byte);
Var
	i:byte;
begin
	write('Vector:');
	For i:= 1 to N do
		write(V[i]:3);
end;

Var
	V:TV;
	N:byte;
Begin
	LeerArchivo(V,N);
	Imprime(V,N);
	MochilaPerfecta(V,N);	
End.

{Program Ad3;
Type
	TV = array[0..100] of integer;

Procedure LeerArchivo(Var V:TV; Var N:byte);
Var
	arch:text;
begin
	N:= 0;
	assign(arch,'Ad3.txt');reset(arch);
	while not eof (arch) do
	begin
		N:= N + 1;
		readln(arch,V[N]);
	end;
	close(arch);
end;

Procedure Verifica(V:TV; N:byte; Var Vm:TV; Var M:byte);
Var
	i:byte;
begin
	M:= 0;
	For i:= 1 to N do
	begin
		If (V[i] > V[i + 1]) then
		begin
			Vm[M]:= V[i];
			M:= M + 1;
		end;
	end;
end;

Procedure Imprime(V,Vm:TV; N,M:byte);
Var
	i:byte;
begin
	write('Vector de numeros ascendentes:');
	For i:= 1 to M do
		write(Vm[i]:4);
end;


Var
	V,Vm:TV;
	N,M:byte;
Begin
	LeerArchivo(V,N);
	Verifica(V,N,Vm,M);
	writeln;
	Imprime(V,Vm,N,M);
end.}

