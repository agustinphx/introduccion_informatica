{Un pago puede realizarse con Tarjeta de crédito, de débito o en efectivo, obteniéndose
incremento del 7%, 5% o descuento del 10% respectivamente sobre el monto original. Se pide
leer el tipo de pago (C, D, E) y el monto para calcular e informar el importe a abonar
calculando el importe a abonar mediante una función.}
Program Pagos;

Function ImporteAbonar(pago:char; mont:real):real;

Begin
	If (pago = 'C') then
		ImporteAbonar:= mont * 1.07
	Else
		if (pago = 'D') then
			ImporteAbonar:= mont * 1.05
		Else
			ImporteAbonar:= mont * 0.9;
end;

Var
	Mpago:char;
	Monto:real;
Begin
	write('Ingrese el monto de su compra: ');readln(Monto); //De aca lee Monto y va a la funcion como parametro pago
	write('Ingrese el medio de pago: C- Credito / D- Debito / E- Efectivo : ');readln(Mpago);// De aca lee Mpago y va a la funcion como parametro mont para verificar las condiciones.
	write('Monto a pagar: $',ImporteAbonar(Mpago,Monto):2:0);
end.

