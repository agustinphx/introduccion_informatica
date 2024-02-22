{Leer las N ventas efectuadas por una farmacia Social. Por cada una se ingresa el monto y
un código indicador del rubro:
L - venta libre
M - medicamentos (23% de descuento)
P - perfumería (promoción 10% de descuento).
A - accesorios (promoción, si el monto supera $X corresponde un 5% de descuento)
Se pide informar:
- por cada venta el importe a pagar (con el descuento efectuado, si corresponde)
- Importe total bonificado en concepto de descuentos
- Total de operaciones e importe total en venta libre
- Monto de venta máximo y a que rubro pertenece}
Program Social;
Var
	i,N:word;
	rubro:char;
	venta,dto,dtoTotal,acumDto,acumV,ContL,acumL,Max:real;
Begin
	acumDto:= 0;
	acumV:= 0;
	ContL:= 0;
	acumL:= 0;
	Max:= -99999;
	write('Ingrese la cantidad de ventas: ');readln(N);
	writeln(' ');
	For i:= 1 to N do
	begin
		writeln(' ');
		write('Ingrese el monto de la venta: ');readln(venta);
		write('Seleccion el rubro: L - Venta libre / M - Medicamentos / A - Accesorios : ');readln(rubro);
		If (rubro = 'L' ) and (Max < venta) then		 
		begin
			Max:= venta; 
			acumV:= acumV + venta;
			dto:= venta * 0.23;
			acumDto:= acumDto + dto; 
			ContL:= ContL + 1;
			acumL:= acumL + venta;
			writeln('El importe a pagar por esta venta es: $',(venta - dto):2:0,' (con descuento aplicado)'); // El precio incluye descuento.
		end
		Else 
			If (rubro = 'M')  and (Max < venta)  then
			begin
				Max:= venta;
				acumV:= acumV + venta;
				dto:= venta * 0.1;
				acumDto:= acumDto + dto;
				writeln('El importe a pagar por esta venta es: $',(venta - dto):2:0,' (con descuento aplicado)');
			end
			Else
				If (rubro = 'A')  and (Max < venta) then
				begin
					Max:= venta;
					acumV:= acumV + venta;
					dto:= venta * 0.05;
					acumDto:= acumDto + dto; // Acumula todos los descuentos
					writeln('El importe a pagar por esta venta es: $',(venta - dto):2:0,' (con descuento aplicado)'); 
				end;
				dtoTotal:= acumDto; // Renombramos la variable.
				venta:= acumV - acumDto; // Restamos el total de venta con el total de descuento para obtener el monto a pagar.
	end;
	writeln(' ');
	writeln('El descuento total es de: $',dtoTotal:2:0);
	writeln(' ');
	writeln('Operaciones en venta libre:',ContL:2:0, ' y el importe total en este rubro es: $',acumL:2:0,' (sin descuento aplicado)');
	writeln('El monto de venta maximo es: $',max:2:0,' y pertenece al rubo: ',rubro);
end.
