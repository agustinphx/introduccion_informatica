{ En un taller de reparación de vehículos, se ha registrado en un archivo los siguientes datos de
las unidades:
  Tipo (1-particular, 2-carga, 3-transporte de pasajeros, 4-oficial, 5-servicios)
  Costo de la reparación
Se pide leer la información para calcular e informar para cada tipo, el monto recaudado y el
porcentaje que representa del total. }
Program eje17;
Type
	St10 = String[10];
	TV = array[0..100] of byte;
	TVC = array[0..100] of real;
	TVConst = array[1..5] of st10;
Const
  TipoServicio:TVConst = ('Particular','Carga','Transporte','Oficial','Servicios');
  
  
  
Procedure LeerArchivo(Var Tipo:TV; Var Cost:TVC; Var N:byte);
Var
	Arch:text;
begin
	N:= 0;
	assign(arch,'eje17.txt');reset(arch);
	while not eof (arch) do
	begin
		N:= N + 1;
		readln(Arch,Tipo[N],Cost[N]);
	end;
	close(arch);
end;

Function SumaTotal(Tipo:TV; Cost:TVC; N:byte):real;
Var
	i:byte;
	aux:real;
begin
	aux:= 0;
	For i:= 1 to N do
	begin
		aux:= aux + Cost[i];
	end;
	SumaTotal:= aux;
end;

Procedure Porcentaje(Tipo:TV; Cost:TVC; N:byte; Var SumaTipo:TVC);
Var
	i,j,aux:byte;
	Porc,SumaTotal:real;
begin
	SumaTotal:= 0; 
	For i:= 1 to N do
	begin
		SumaTotal:= SumaTotal + Cost[i];
		aux:= Tipo[i];
		SumaTipo[aux]:= SumaTipo[aux] + Cost[i];
	end;
	
	For j:= 1 to 5 do //Recorremos en referencia a particular,carga,transporte de pasajeros,oficial y servicios.
	begin
		Porc:= (SumaTipo[j] / SumaTotal) * 100;
		writeln('El servicio ',TipoServicio[j],' recaudo: $',SumaTipo[j]:2:0,' y su porcentaje es del ',Porc:2:0,' % sobre el total');
	end;
end;

Var
	Tipo:TV;
	Cost,SumaTipo:TVC;
	N:byte;
Begin
	LeerArchivo(Tipo,Cost,N);
	Porcentaje(Tipo,Cost,N,SumaTipo);
end.
