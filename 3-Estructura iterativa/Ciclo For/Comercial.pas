{En un centro comercial se bonifica el estacionamiento de acuerdo al monto de la compra. El
valor de la hora de estacionamiento es de $ 1.5 por hora.
Monto <= $20 no se bonifica
$20 < Monto <= $50 2 horas gratis
$50 < Monto <= $100 3 horas gratis
$ 100 < Monto gratis si día 1..5, otros días $ 8 de descuento
2.1-Procesar para un día determinado los datos (montos y horas ) de un conjunto de clientes e
informar:
 Total de autos que no pagaron
 Total de autos que pagaron con descuento
2.2-Proponer un ejemplo cuyo resultado sea 2 autos con descuento y 3 autos no pagaron.}
Program Comercial;
Var
	hs,dia:byte;
	i,N,Cont,ContDto:word;
	Monto:real;
Begin
	Cont:= 0;
	ContDto:= 0;
	write('Ingrese la cantidad de clientes: ');readln(N);
	For i:= 1 to N do
	begin
		write('Ingrese el dia: ');readln(dia);
		write('Ingrese la cantidad de horas que estaciono: ');readln(hs);
		Monto:= hs * 1.5; //Valor de cada hora por $1.5
		
		If (Monto > 100) and (dia <= 5) then //En base al monto y dia evaluamos las siguientes condiciones.
		begin
			writeln('Es gratis');
			Monto:= 0;
			Cont:= Cont + 1; //
		end
		Else
			If (Monto > 100) and (dia > 5) then	
			begin
				Monto:= Monto - 8;
				ContDto:= ContDto + 1; //Cuenta los clientes con descuento.
			end
			Else
				If (Monto > 50) and (Monto <= 100) then
				begin
					Monto:= Monto - 4.5; //Descuento de 3 horas gratis 
					ContDto:= ContDto + 1;
				end
				Else
					if (Monto > 20) and (Monto <= 50) then
					begin
						Monto:= Monto - 3; //Descuento 2 horas gratis.
						ContDto:= ContDto;
					end
					Else
					begin
						Monto:= Monto;
						Cont:= Cont + 1; //Cuenta los clientes sin descuento.	
					end;
		writeln('El precio a abonar es: $',Monto:2:2); //Añadí esta linea de código para verificar que este calculando bien el precio.
		writeln(' ');
	end;
	writeln('La cantidad de autos que no pagaron son: ',Cont);
	writeln('La cantidad de autos que pagaron con descuento son: ',ContDto);
end.
