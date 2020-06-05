{ El área de RRHH de una empresa desea conocer cuántos de sus empleados cumplen años
cada uno de los 12 meses. Se conoce mes(1..12) y cantidad de los N empleados, se pide ingresar
dicha información para emitir el siguiente listado:
 Mes Cantidad
 Enero 100
 Febrero 350
 Marzo 270
Además indicar el mes con mayor cantidad de cumpleaños.0}
Program eje16;
Type
	st9 = string[9];
	TVM = array[1..12] of st9;
	TVC = array[0..100] of word;
	
Procedure LeerVectores(Var Mes:TVM; Var Cant:TVC; Var N:byte);
Var
	i:byte;
	Esp:char;
	arch:text;
begin	
	assign(arch,'eje16.txt');reset(arch);
	readln(arch,N);
	For i:= 1 to N do
	begin
		readln(arch,Mes[N],Esp,Cant[N]);
		writeln(Mes[N],Esp,Cant[N]);
	end;
	close(arch);
end;

Procedure MasCumples(Mes:TVM; Cant:TVC; N:byte);
Var
	i:byte;
	Max:word;
	MaxM:string[5];
begin
	Max:= 0;
	For i:= 1 to N do
	begin
		If (Cant[i] > Max) then
		begin	
			Max:= Cant[i];
			MaxM:= Mes[i];
		end;
	end;
	writeln('El mes con mayor cantidad de cumpleanios es ',MaxM,' con ',Max,' cumpleanios');
end;



Var
	Mes:TVM;
	Cant:TVC;
	N:byte;
Begin
	LeerVectores(Mes,Cant,N);
	MasCumples(Mes,Cant,N);
end.
