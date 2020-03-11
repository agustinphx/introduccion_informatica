//Calcular e informar el vuelto (con menor cambio) que se deberá entregar por una compra abonada con un billete de 100 pesos.
//- Si el vuelto es un billete de $20, uno de $10 y dos de $2, ¿cuánto gasto?
Program vuelto3; 
Var
	billete,vuelto,gasto:integer;

Begin
writeln('Con que billete va abono: ?');readln(billete);
writeln('Cual es su vuelto : ?');readln(vuelto);
gasto:= billete - vuelto;
writeln('Gasto :',gasto);readln(gasto);
end.
