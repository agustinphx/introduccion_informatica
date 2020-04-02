Program testing;
Var
	arch:text;
	i,N,mutual:byte;
	matricula:string[5];
	espacio,turno: char;
	X:real;

Begin
	Assign(arch,'testing.txt'); reset(arch);
	readln(arch,N);readln(arch,X);
	For i:= 1 to N do
	begin
		read(arch,matricula);
		writeln(matricula);
		read(arch, mutual);
		writeln(mutual);
		writeln(turno);
		while (mutual <> 0) do
		begin
			readln(arch, espacio, turno);
			read(arch, mutual);
			
			If mutual = 0 then
				readln(arch);
		end;
	end;
	close(arch);
END.


{
Function ImporteConsulta(Matricula:word; Mutual:string; Monto:real):real;
var 
	PrecioMutual,Recargo,Porcentaje:real;
begin
	If(Mutual = '1') then
		writeln('sin cargo')
			
	Else If(Mutual= '2') then
		PrecioMutual:= 350	
		
	Else If(Mutual = '3') then
		PrecioMutual:= 200
		
	Else If(Mutual = '4') then
		PrecioMutual:= 800;
	
	If(Turno = 'N') then
	begin
		Recargo:=PrecioMutual + 50;
		Porcentaje:= PrecioMutual*(N/100);
		
	If(Recargo > Porcentaje) then
		PrecioMutual:=Recargo
	Else
		PrecioMutual:=Porcentaje;
	ImporteConsulta:= PrecioMutual;
	end;
end;
}



