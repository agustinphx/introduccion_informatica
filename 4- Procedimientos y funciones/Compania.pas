{ Se tiene un conjunto de datos de N clientes de una compañía de electricidad, estos son:
 Número de cliente
 Estado actual del medidor (en kw)
 Estado anterior del medidor
Leer de un archivo los datos de los clientes, calcular e informar el consumo, el importe junto
al número de cliente.
El importe se calcula con un básico fijo de $50, más un monto variable que depende del
consumo, se establece una escala de valores para el precio por kw según rangos de consumo:
$5 consumo <=100
$3.7 100< consumo <=250
$2.5 250 < consumo}
Program compania;

Function CalculaImporte(Eact,Eant:real):real;
Var
	aux,E:real;
begin
	E:= Eact - Eant;
	aux:= 50;
	If(E <= 100) then
		aux:= aux + (E * 5)
	Else
		if(E <= 250) then
			aux:= aux + (E * 3.7)
		Else
			aux:= aux + (E * 2.5);
	
	CalculaImporte:= aux;
end;

Procedure LeerArchivo;
Var
	i,N:byte;
	Esp:char;
	Eant,Eact,NumC:real;
	arch:text;
begin
	assign(arch,'Compania.txt');reset(arch);
	readln(arch,N);
	For i:= 1 to N do
	begin
		readln(arch,NumC);
		read(arch,Eact,Esp,Eant);
		writeln('Cliente: ',NumC:2:0,' tuvo un consumo de: ',Eact:2:2,' kw  por lo que debe abonar: $',CalculaImporte(Eact,Eant):2:2);
		writeln;
	end;
	close(arch);
end;

Begin 
	LeerArchivo;
end.
