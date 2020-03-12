//2.- Calcular e informar el vuelto (con menor cambio) que se deberá entregar por una compra abonada con un billete
//d.- De dos ejemplos de montos de gasto y sus respectivos vueltos
Program gasto4;
Var
	billete,gasto,vuelto:integer;	
Begin
Writeln('Con que billete va abonar?');readln(billete);
writeln('Ingrese el monto de su gasto?');readln(gasto);
vuelto:= billete -  gasto;
writeln('Su vuelto es :',vuelto);readln(vuelto);

end.
