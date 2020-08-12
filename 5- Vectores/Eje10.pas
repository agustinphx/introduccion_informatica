{Ingresar un número real X y a continuación N números reales, luego evaluar si X se encuentra
entre los N números (no están ordenados).
Informar:
- Si lo encuentra:
 a. el mensaje "el número pertenece al conjunto"
 b. la cantidad de veces que figura
 c. los lugares que ocupa dentro del conjunto de números
- Si no lo encuentra el mensaje "el número no pertenece al conjunto". }
Program Eje10;
Type
	TV = array[1..100] of real;
	
Procedure LeeVector(Var V:TV; Var N:byte);
Var
	i:byte;
begin
	write('Ingrese la cantidad de numeros: ');readln(N);
	For i:= 1 to N do
	begin
		write('Ingrese un numero: ');readln(V[i]);
	end;
end;

Procedure Busca(V:TV; N:byte; X:real);
Var
	i,Cont:byte;
begin
	Cont:= 0;
	For i:= 1 to N do
	begin
		If (V[i] = X) then
		begin
			Cont:= Cont + 1;
			writeln('El numero ',X:2:0,' pertenece al conjunto en la posicion ',i);
		end;
	end;
	writeln;
	If (Cont = 0) then
		writeln('El numero no pertenece al conjunto')
	Else
		writeln('La cantidad de veces que ',X:2:0,' aparece son: ',Cont);
end;

Var
	V:TV;
	N:byte;
	X:real;
Begin
	write('Ingrese un numero: ');readln(X);
	writeln;
	LeeVector(V,N);
	writeln;
	Busca(V,N,X);
end.
