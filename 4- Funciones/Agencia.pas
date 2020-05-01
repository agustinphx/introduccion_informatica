{Una agencia organiza promociones en el verano y las ofrece a distintas empresas.
De cada pedido que hace una Empresa se conoce:
- Código de Empresa ( XXX = fin de datos)
- Si desea Plotear el vehículo (S/N)
- Cantidad de días que dura la promoción
Además se sabe que el costo del pedido se calcula según la siguiente Tabla:
Se pide desarrollar un programa Pascal que ingrese la lista de pedidos a satisfacer y luego calcule e
informe:
a) Para cada Empresa el costo del pedido.
b) El máximo importe cotizado de las promociones que solicitaron ploteado del vehículo. Puede no
haber promociones con ploteo.
Ejemplo:
Código Ploteo Días
AAA1 S 12
BBB5 N 20
CCC7 S 5
DD3 S 10
XXX
Precio base $8000 (incluye vehículo con chofer )
Ploteo del vehículo $5000
Días ($300 por día)
< a7 días
+15%
7 <= d <=15 igual precio / Más de 15 d -10%
* Se pide desarrollar un programa Pascal que ingrese la lista de pedidos a satisfacer y luego calcule e
informe:
a) Para cada Empresa el costo del pedido.
b) El máximo importe cotizado de las promociones que solicitaron ploteado del vehículo. Puede no
haber promociones con ploteo.
Para la solución usar una función Costo, que utilizando los parámetros que considere necesarios calcule el costo del pedido}
Program agencia;

Function Costo(plo:char; ds:byte):real;
Var
	Pr:real;
Begin
	Pr:= 0;
	Pr:= Pr + 8000 + (ds * 300);
		
		If(plo = 'S') then
			Pr:= Pr + 5000;
		
		Case ds of
			1..6:Pr:= Pr * 1.15;
			15..100:Pr:= Pr * 0.9;
		end;
			
	Costo:= Pr;
end;

Var
	Dias:byte;
	Cod:string[4];
	Plot:char;
	Max,Aux:real;
Begin
	Max:= 0;
	Aux:= 0;
	write('Ingrese el codigo de la empresa: ');readln(Cod);
	while (Cod <> 'XXX') do
	begin
		write('Desea plotear el auto? S/N: ');readln(Plot);
		write('Ingrese la cantidad de dias que dura la promocion: ');readln(Dias);
		Aux:= Costo(Plot,Dias); //Auxiliar para llamar a la funcion y empezar a calcular las condiciones siguientes.
		
		If (Plot = 'S') and (Aux > Max) then //Se evaluan las condiciones para determinar el pedido con ploteo de mayor costo.
			Max:= Aux; 

		writeln('a- Costo del pedido: $',Costo(Plot,Dias):2:0);
		writeln;
		writeln;
		writeln('Si desea finalizar ingrese: XXX en lugar del codigo');
		write('Ingrese el codigo de la empresa: ');readln(Cod);
	end;
	writeln;
	writeln('b- Maxima cotizacion con ploteo: $',Max:2:0);

end.

