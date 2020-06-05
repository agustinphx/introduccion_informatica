{ En un taller de reparación de vehículos, se ha registrado en un archivo los siguientes datos de
las unidades:
  Tipo (1-particular, 2-carga, 3-transporte de pasajeros, 4-oficial, 5-servicios)
  Costo de la reparación
Se pide leer la información para calcular e informar para cada tipo, el monto recaudado y el
porcentaje que representa del total. }
Program eje17;
Type
	TV = array[0..100] of byte;
	TVC = array[0..100] of real;

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

Procedure Suma(Tipo:TV; Cost:TVC; N:byte; Var aux1,aux2,aux3,aux4,aux5:real);
Var
	i:byte;
begin
	aux1:= 0;
	aux2:= 0;
	aux3:= 0;
	aux4:= 0;
	aux5:= 0;
	For i:= 1 to N do
	begin
		Case Tipo[i] of
			1:aux1:= aux1 + Cost[i];
			2:aux2:= aux2 + Cost[i];
			3:aux3:= aux3 + Cost[i];
			4:aux4:= aux4 + Cost[i];
			5:aux5:= aux5 + Cost[i];
		end;
	end;
	writeln('Total recaudado por el tipo 1: $',aux1:2:0);
	writeln('Total recaudado por el tipo 2: $',aux2:2:0);
	writeln('Total recaudado por el tipo 3: $',aux3:2:0);
	writeln('Total recaudado por el tipo 4: $',aux4:2:0);
	writeln('Total recaudado por el tipo 5: $',aux5:2:0);
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

Procedure Porcentaje(Tipo:TV; Cost:TVC; N:byte; aux1,aux2,aux3,aux4,aux5:real);
Var
	i:byte;
	Tot,Porc1,Porc2,Porc3,Porc4,Porc5:real;
begin
	Tot:= SumaTotal(Tipo,Cost,N);
	For i:= 1 to N do
	begin			
		Case Tipo[i] of
			1:Porc1:= (aux1 / Tot) * 100;
			2:Porc2:= (aux2 / Tot) * 100;
			3:Porc3:= (aux3 / Tot) * 100;
			4:Porc4:= (aux4 / Tot) * 100;
			5:Porc5:= (aux5 / Tot) * 100;	
		end;
	end;
	writeln;
	writeln('El porcentaje segun el total del tipo 1 es: ',Porc1:2:0,' %');
	writeln('El porcentaje segun el total del tipo 2 es: ',Porc2:2:0,' %');
	writeln('El porcentaje segun el total del tipo 3 es: ',Porc3:2:0,' %');
	writeln('El porcentaje segun el total del tipo 4 es: ',Porc4:2:0,' %');
	writeln('El porcentaje segun el total del tipo 5 es: ',Porc5:2:0,' %');
end;

Var
	Tipo:TV;
	Cost:TVC;
	N:byte;
	aux1,aux2,aux3,aux4,aux5:real;
Begin
	LeerArchivo(Tipo,Cost,N);
	Suma(Tipo,Cost,N,aux1,aux2,aux3,aux4,aux5);
	Porcentaje(Tipo,Cost,N,aux1,aux2,aux3,aux4,aux5);
end.	



