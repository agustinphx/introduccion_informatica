// Se ingresa el monto de una venta y muestra el descuento obtenido.
Program comercio;
Var
	Dto,monto:real;
	CantV,ventas:word;
Begin
	CantV:=0;
	ventas:= 0;
repeat
	write('ingrese el monto de la venta: ');readln(monto);
	If(monto > 0) then
		CantV:=CantV+1
	Else
		If (monto < 1000) then
			ventas:= ventas + 1	
		Else
			If (monto > 1000) then
			begin
				Dto:=monto*0.90;
				writeln('tiene descuento del 10% debe abonar: $' ,Dto:4:2);
			end;	
until(monto=0);

	writeln('la cantidad de ventas son :' ,CantV);
	writeln('la cantidad de ventas sin descuento son: ',ventas);

end.
