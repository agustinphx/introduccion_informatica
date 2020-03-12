//Un supermercado otorga puntos para canjear por premios, por las compras que realiza en tres rubros. 
//Otorga 1 punto cada $3 en alimentos,$2 en limpieza y $5 en otros.
//Ingresar los tres importes e informar los puntos obtenidos. (si en algún rubro no realizó compras, dicho importe es cero)


Program canjes;

Var
	rubro:char;
	puntos,compra:real;
	
Begin
writeln('ingrese el valor de su compra :');readln(compra);
writeln('Ingrese el rubro que desea canjear : 1- alimentos / 2- limpieza / 3- otros');readln(rubro);
If (rubro = '1') then
	puntos:= compra / 3
Else if (rubro = '2') then
	puntos:= compra / 2
Else if (rubro = '3') then
	puntos:= compra / 5;
writeln('Los puntos obtenidos son :',puntos:2:0);
end.
