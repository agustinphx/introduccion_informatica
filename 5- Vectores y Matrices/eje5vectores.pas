Program vectores;
Type
	TV = array [1..100] of integer;
Var
	V:TV;
	N:byte;

Procedure LeerArchivo( var V:TV; var N:byte);
Var
	arch:text;
Begin
	N:=0;
	assign(arch,'eje5vectores.txt');reset(arch);
	while not eof(arch) do
	begin
		N:= N + 1;
		readln(arch,V[N]);
	end;
	close(arch);
end;
	
Procedure ImprimirVector( var V:TV; N:byte);
Var
	i:byte;
Begin
	For i:= 1 to N do
	begin
		If V[i]> 50 then  // V[i] es el vector y posición inicial al momento de evaluar la condición,si es mayor a 50 pasa a ser impreso por pantalla.
		writeln(V[i]);
	end;
end;
	
Begin
	LeerArchivo(V,N);
	ImprimirVector(V,N);
End.
