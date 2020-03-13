//Una farmacia aplica al precio de los remedios el 10% de descuento. Realice
//un programa que ingresado el precio del producto, calcule el descuento y el precio final,
//precio final, sacando por pantalla lo siguiente:
												//	Precio de producto XXX.XX
												//	-
												//	Descuento YY.YY
												//	------------
												//	Valor a pagar RRR.RR
Program farmacia;
Var
	precioProducto,precioFinal,descuento:real;
Begin
write('ingrese el precio del producto : ');readln(precioProducto);
descuento:= precioProducto * 0.10;
precioFinal:= precioProducto - descuento;
writeln('El descuento es de: $',descuento:2:0, ' y el valor final es de: $',precioFinal:2:0);
end.
					
