// Se ingresa el monto de una venta y muestra el descuento obtenido.
Program comercio;
Var
	Dto,monto:real;
	CantV,ventas:word;
Begin
	CantV:=0;
repeat
	writeln('ingrese el monto de la venta');readln(monto);
	if(monto > 0) then
	CantV:=CantV+1;
	
	if(monto > 1000) then
	begin
	Dto:=monto*0.90;
	writeln('tiene descuento del 10% debe abonar:' ,Dto:4:2);
	end;
	
	If(monto < 1000) then
	ventas:= ventas + 1;		
until(monto=0);

	writeln('la cantidad de ventas son :' ,CantV);
	writeln('la cantidad de ventas sin descuento son: ',ventas);

end.
