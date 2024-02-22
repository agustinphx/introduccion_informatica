{Ingresar los elementos de un vector A, a continuación ingresar los de un vector B, si la cantidad de
componentes ingresadas para cada uno de los vectores no es la misma indicar con un cartel y finalizar, de lo
contrario calcular :
a. La suma y la diferencia de los vectores.
b. El producto escalar.}
Program Ad5;
Type
	TVA = array[1..50] of integer;
	TVB = array[1..50] of integer;
	
Procedure LeerVectores(Var A:TVA; Var B:TVB; Var N,M:byte);
Var
	i:byte;
begin
	write('Ingrese la cantidad de elementos del vector A: ');readln(N);
	For i:= 1 to N do 
	begin
		write('Ingrese un numero: ');readln(A[i]);
	end;
	writeln;
	write('Ingrese la cantidad de elementos del vector B: ');readln(M);
	For i:= 1 to M do
	begin
		write('Ingrese un numero: ');readln(B[i]);
	end;
end;

Function Suma(A:TVA; B:TVB; N:byte):integer;
Var
	i:byte;
	Sum:integer;
begin
	Sum:= 0;
	For i:= 1 to N do
		Sum:= Sum + A[i] + B[i];
	Suma:= Sum;
end;

Function Diferencia(A:TVA; B:TVB; N:byte):integer;
Var
	i:byte;
	Dif:integer;
begin
	Dif:= 0;
	For i:= 1 to N do
		Dif:= A[i] - B[i];
	Diferencia:= Dif;
end;

Function Escalar(A:TVA; B:TVB; N:byte):integer;
Var
	i:byte;
	Esc:integer;
begin
	Esc:= 0;
	For i:= 1 to N do
		Esc:= Esc + (A[i] * B[i]);
	Escalar:= Esc;
end;

Procedure Imprime(A:TVA; N:byte);
Var
	i:byte;
begin
	For i:= 1 to N do
		write(A[i]:4);
end;

Var
	A:TVA;
	B:TVB;
	N,M:byte;
Begin
	LeerVectores(A,B,N,M);
	writeln;
	write('Vector A: ');
	Imprime(A,N);
	writeln;
	writeln;
	write('Vector B: ');
	Imprime(B,M);
	writeln;
	writeln;
	If (N <> M) then
		writeln('Los vectores no poseen la misma cantidad de elementos')
	Else
		begin
			writeln('La suma de los vectores es: ',Suma(A,B,N));
			writeln('La diferencia entre los vectores es: ',Diferencia(A,B,N));
			writeln('El producto escalar entre los vectores A y B es: ',Escalar(A,B,N));
		end;
end.
