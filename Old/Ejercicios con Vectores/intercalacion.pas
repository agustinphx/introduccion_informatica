Program interc;
Type 
	TV=array[1..100] of byte;

Var
	V1,V2,V3:TV;
	N,M,K,i:byte;
	arch:text;
Procedure intercalacion(V1,V2:TV; N,M:byte; Var V3:TV; Var K:byte);
Var t,i,j:byte;
begin
	j:=1;
	i:=1;
	k:=0;
	While(i<=N) and (j<=M) do
	begin
	K:=K+1;
		If(V1[i] < V2[j]) then
		begin
			V3[K]:=V1[i];
			i:=i+1;
		end
		Else
			If(V1[i] > V2[j]) then
				begin
					V3[K]:=V2[j];
					j:=j+1;
				end
				else
					begin
						V3[K]:=V1[i];	
						i:=i+1;
						j:=j+1;
					end;
					
		For t:=i to N do
			begin
				K:=K+1;
				V3[K]:=V1[t];
			end;
		For t:= j to M do
			begin
				K:=K+1;
				V3[K]:=V2[t];
			end;
end;
end;		
	Procedure cargaVector(V1,V2:TV; N,M:Byte);
	begin
	var i,j:byte;
	begin
	i:=1;
	j:=1;
	For t:= 1 to N do
	begin
		i:=i+1;
		V1[i]
		
procedure lee()
	
	
begin
	intercalacion(V1,V2,V3,N,M);
	
	assign(arch, 'intercalacion.txt'); //esto es para leer desde el archivo
	reset(arch);
	
	close(arch);
	
	For i:=1 to K do //imprime el vector
	begin
		writeln('los resultados del vector son :');
		write(V3[i]);
	end;
	
end.

//tp n2 ejercicio 1





{
* for i:=1 to 4 do
* readln(algo);
* v[i]:= algo;
* 
* lunes martes miercoles jueves
* 
* v[1]:= lunes;
* v[2]:= martes;
* v[3]:= miercoles;
* v[4]:= jueves;
* 
* }
