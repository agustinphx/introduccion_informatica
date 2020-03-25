{Un comercio realiza el 10% de descuento por ventas mayores a $1000. Leer la cantidad de
ventas realizadas , y luego el importe de cada una, calcular e informar las ventas con descuento y las que no tuvieron dicho beneficio.}
Program comercio;
Var
	i,N:word;
	ventas,SumDto,SinDto,dto:real;
Begin
	SumDto:= 0;
	SinDto:= 0;
	dto:= 0;
	
	write('Ingrese la cantidad de ventas: ');readln(N);
	writeln(' ');
	
	For i:= 1 to N do
	begin
		write('Ingrese el monto de la venta: ');readln(ventas);
		dto:= ventas * 0.1;
		If (ventas > 1000) then
			SumDto:= SumDto + 1 // Suma las ventas con descuento.
		Else
			SinDto:= SinDto + 1;
	end;
	
	writeln(' ');
	writeln('El total de descuentos obtenidos es: ', dto:2:0);
	writeln('La cantidad de ventas con descuento son: ',SumDto:2:0);
	writeln('La cantidad de ventas sin descuento son: ',SinDto:2:0);
end.		
