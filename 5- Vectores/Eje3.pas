{ Ingresar en un arreglo N números enteros, generar dos arreglos VPos y VNeg que contendrán
los números positivos y negativos respectivamente. Mostrar el más numeroso, ambos si la cantidad
de elementos coinciden}
Program eje3;
Type
	TV = array[1..100] of integer;
	
Procedure LeeVector(Var Vec:TV; Var N:byte);
Var
	Num:integer;
begin
	N:= 0;
	write('Ingrese un numero (0 cuando desee finalizar) : ');readln(Num);
	while (Num <> 0) do                         
	begin
		N:= N + 1;
		Vec[N]:= Num;
		write('Ingrese un numero : ');readln(Num);
	end;
end; 		

Procedure GeneraArrays(Vec:TV; N:byte;  Var M,K:byte; Var VPos,VNeg:TV);
Var
	i:byte;
begin
	M:= 0;
	K:= 0;
	For i:= 1 to N do
	begin
		If (Vec[i] > 0) then
		begin
			M:= M + 1;
			VPos[M]:= Vec[i];
		end
		Else
		begin
			K:= K + 1;
			VNeg[K]:= Vec[i];
		end;
	end;
end;

Procedure Muestra(VPos:TV; VNeg:TV; M:byte; K:byte);
Var
	i:byte;
begin
	writeln;
	If (M = K) then
	begin
		writeln('Ambos vectores poseen la misma cantidad de numeros');
		For i:= 1 to M do
			writeln(VPos[i]);
		writeln;
		For i:= 1 to K do
			writeln(VNeg[i]);
	end
	Else
		If (M > K) then
		begin
			writeln('El vector  mas numeroso es el positivo con los numeros: ');
			For i:= 1 to M do
			writeln(VPos[i]);
		end
		else
		begin
			writeln('El vector  mas numeroso es el negativo con los numeros: ');
			For i:= 1 to K do
			writeln(VNeg[i]);
		end;
end;

Var
	Vec,VPos,VNeg:TV;	
	N,M,K:byte;
Begin
	LeeVector(Vec,N);
	GeneraArrays(Vec,N,M,K,VPos,VNeg);
	Muestra(VPos,VNeg,M,K);
end.
