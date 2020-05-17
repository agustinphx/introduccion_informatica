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
Var
	N:byte;

Function CalculaImporte(Eact,Eant:real):real;
Var
	aux:real;
begin
	aux:= 50;
	If(Eact <= 100) then
		aux:= aux + (Eact * 5)
	Else
		if(Eact <= 250) then
			aux:= aux + (Eact * 3.7)
		Else
			aux:= aux + (Eact * 2.5);
	
	CalculaImporte:= aux;
end;

Procedure LeerArchivo(var N:byte);
Var
	i:byte;
	NumC:word;
	Esp:char;
	Eant,Eact:real;
	arch:text;
begin
	assign(arch,'Compania.txt');reset(arch);
	readln(arch,N);
	For i:= 1 to N do
	begin
		readln(arch,NumC);
		read(arch,Eact,Esp,Eant);
		writeln('Cliente: ',NumC,' debe abonar: $',CalculaImporte(Eact,Eant):2:2);
		writeln;
	end;
end;

Begin 
	LeerArchivo(N);
end.
