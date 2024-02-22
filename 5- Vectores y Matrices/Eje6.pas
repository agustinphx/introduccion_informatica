{Ingresar los elementos de un vector A y a continuación ingresar los de un vector B, si la cantidad
de componentes ingresadas para cada uno de los vectores no es la misma indicar con un cartel y
finalizar, de lo contrario calcular:
a. La suma y la diferencia de los vectores. 
b. El vector que posee mas elementos}
Program eje6;
Type
	TV = array[1..100] of integer;

Procedure LeerVectores(Var VA:TV; Var VB:TV; Var N,M:byte);
Var
	i:byte;
begin
	write('Ingrese la cantidad de numeros del vector A: ');readln(N);
	For i:= 1 to N do
	begin	
		write('Ingrese un numero para el vector A: ');readln(VA[i]);
	end;
	writeln;
	write('Ingrese la canitdad de numeros del vector B: ');readln(M);
	For i:= 1 to M do
	begin
		write('Ingrese un numero para el vector B: ');readln(VB[i]);
	end;
end;

Procedure Compara(VA,VB:TV; N,M:byte);
Var
	i:byte;
	SumA,SumB,Dif:integer;
begin
	SumA:= 0;
	SumB:= 0;
	For i:= 1 to N do
	begin
		SumA:= SumA + VA[i];
	end;
	For i:= 1 to M do
	begin
		SumB:= SumB + VB[i];
	end;
	writeln;
	Dif:= SumA - SumB;
	writeln('La suma del vector A es: ',SumA);
	writeln('La suma del vector B es: ',SumB);
	writeln;
	writeln('La diferencia entre los vectores (A - B) es: ',Dif);
	writeln;
	
	If (N > M) then
		writeln('El vector A es el que  posee mas cantidad de elementos ')
	Else
		writeln('El vector B es el que posee mas cantidad de elementos ');
end;

Var
	VA,VB:TV;
	N,M:byte;
Begin
	LeerVectores(VA,VB,N,M);
	Compara(VA,VB,N,M);
end.
