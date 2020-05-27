{-Almacenar en una vector K números reales, se sabe que existen elementos nulos. Generar un
nuevo arreglo donde cada uno de sus elementos sean la suma de los valores previos a un cero.
Ejemplos: K= 11, (2, 6, 0, 1, 0, 4, 7,-2,0, 8, 4)  (8, 1, 9)
 (0, 2, 6, 0, 1, 0, 4, 7, -2, 3, 0) (0, 8, 10) }
Program eje4;
Type
	TV = array[1..100] of real;
	
Procedure LeeVector(Var V:TV; Var K:byte);
Var
	i:byte;
	arch:text;
begin
	assign(arch,'Eje4.txt');reset(arch);
	readln(arch,K);
	For i:= 1 to K do
		readln(arch,V[i]);
end;

Procedure Suma(var V:TV; K:byte; Var VSum:TV);
Var
	i,N:byte;
	Sum:real;
begin
	Sum:= 0;
	N:= 0;
	For i:= 1 to K do
	begin	
		If (V[i] <> 0) then
			Sum:= Sum + V[i]
		Else
		begin
			N:= N + 1;
			VSum[N]:= Sum;
			writeln(VSum[N]:2:0);
			Sum:= 0;
		end;
	end;
end;

Var
	V,VSum:TV;
	K:byte;
Begin
	LeeVector(V,K);
	Suma(V,K,VSum);
end.
