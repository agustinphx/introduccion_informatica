{- Escribir un programa Pascal eficiente y correctamente modularizado que resuelva el siguiente problema:
Leer desde archivo sobre un vector C (calcular la cantidad N de componentes). Se sabe que contiene elementos
negativos no consecutivos .
Construir otro vector de la siguiente manera: cada elemento será el máximo entre dos negativos. Escribir el
vector generado
Ejemplo: Archivo: 2, 3 , 4, -7, 4, 5, -5, 7, 5, 3, 7, 8, 9, -1, 2, 3, -2
 N= 17 C = ( 2 , 3 , 4, -7, 4, 5, -5, 7, 5, 3, 7, 8, 9, -1, 2, 3, -2) luego B = (5, 9,3) }
Program Ad4;
Type
	TV = array[1..100] of integer;

Procedure LeerArchivo(Var C:TV; Var N:byte);
Var
	i:byte;
	arch:text;
begin
	assign(arch,'Ad4.txt');reset(arch);
	readln(arch,N);
	For i:= 1 to N do
		read(arch,C[i]);
	close(arch);
end;

Procedure Verifica(C:TV; N:byte; Var B:TV; Var M:byte);
Var
	i,Cont1,Cont2:byte;
	Max:integer;
begin
	M:= 0;
	Max:= 0;
	i:= 0;
	Cont1:= 0;
	Cont2:= 0;
	while (i <= N) and (C[i] < 0) do
	begin
		If (C[i] < 0) then
			Cont1:= Cont1 + 1;
			
		If (C[i] < 0) and (Cont1 = 1) then
			Cont2:= Cont2 + 1;
		
		If (C[i] > Max) and (Cont2 = 1) then
		begin	
			B[M]:= C[i];
			M:= M + 1;
		end;
	end;
end;

Procedure Imprime(B:TV; M:byte);
Var
	i:byte;
begin
	write('Vector B: ');
	For i:= 1 to M do
		write(B[i]:4);
end;

Var
	C,B:TV;
	N,M:byte;

Begin
	LeerArchivo(C,N);
	Verifica(C,N,B,M);
	Imprime(B,M);
end.
