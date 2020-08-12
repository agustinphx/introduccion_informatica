{ A partir de los dos arreglos del ejercicio 5 que almacenan Patente y Precio de un conjunto de
autos se pide desarrollar un procedimiento que los ordene por patente. Luego en otro
procedimiento mostrar ambos arreglos. }
Program eje12;
Type
	st6 = string[6];
	TVPat = array[1..100] of st6;
	TVPre = array[1..100] of real;
	TVA = array[1..100] of word;
	
Procedure LeerVectores(Var VPat:TVPat; Var VPre:TVPre; Var VA:TVA; Var N:byte);
Var
	Esp:char;
	arch:text;
begin
	N:= 0;
	assign(arch,'Vehiculos.txt');reset(arch);
	while not eof (arch) do
	begin
		N:= N + 1;
		readln(arch,VPat[N],Esp,VA[N],VPre[N]);
	end;
	close(arch);
end;

Procedure Ordena(Var VPat:TVPat; Var VPre:TVPre; N:byte);
Var
	i,j:byte;
	aux:string;
	auxPre:real;
begin
	For i:= 1 to N do
	begin
		For j:= 1 to N - 1 do
		begin
			If (VPat[j] > VPat[j + 1])  then
			begin
				aux:= VPat[j];
				VPat[j]:= VPat[j + 1];
				VPat[j + 1]:= aux;
				auxPre:= VPre[j];
				VPre[j]:= VPre[j + 1];
				VPre[j + 1]:= auxPre;
			end;
		end;
	end;
end;

Procedure Imprime(VPat:TVPat; VPre:TVPre; N:byte);
Var
	i:byte;
begin
	For i:= 1 to N do
	begin
		writeln(VPat[i],' ',VPre[i]:2:0);
	end;

end;

Var
	VPat:TVPat;
	VPre:TVPre;
	VA:TVA;
	N:byte;

Begin
	LeerVectores(VPat,VPre,VA,N);
	Ordena(VPat,VPre,N);
	Imprime(VPat,VPre,N);
end.
