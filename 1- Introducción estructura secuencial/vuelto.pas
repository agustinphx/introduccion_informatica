//Calcular e informar el vuelto (con menor cambio) que se deberá entregar por una compra abonada con un billete de 100 pesos.
//- Si el vuelto es un billete de $20, uno de $10 y dos de $2, ¿cuánto gasto?
Program vuelto3; 
Var
	billete,vuelto,gasto:integer;
Begin
	writeln('Con que billete abono?');readln(billete);
	writeln('Cual fue su vuelto?');readln(vuelto);
	gasto:= billete - vuelto;
	writeln('Su gasto fue: ',gasto);readln(gasto);
end.
