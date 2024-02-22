{Una empresa fumigadora, cobra a los productores distintos aranceles según el tipo de
fumigación y la cantidad de hectáreas.
Tipo 1 y 2 : 20 $/ha.
Tipo 3 : 30 $/ha.
Tipo 4 : 40 $/ha.
Además :
Si el área a fumigar es mayor que 100 has. se aplica un 5% de descuento.
Si el importe total supera los $1.500 se aplica un 10% de descuento, sobre la cantidad que
excede los $1.500.
Determine los datos que se requieren para calcular el importe a pagar por un servicio de
fumigación}
Program TP1eje9;
Var
	hectareas:longint;
	precio,cantExcedida:real;
	tipo:byte;
Begin
	write('Ingrese la cantidad de hectareas a fumigar : ');readln(hectareas);
	write('Seleccion el tipo de fumigacion : 1 / 2 / 3 / 4 : ');readln(tipo);
	Case tipo of
		1: precio:= hectareas * 20;
		2: precio:= hectareas * 20;
		3: precio:= hectareas * 30;
		4: precio:= hectareas * 40;
	end;
	
	If (hectareas > 100) then
		precio:= precio * 0.95;
		
	If( precio > 1500) then
	begin
		cantExcedida:= (precio - 1500) *0.9;
		precio:= 1500 + cantExcedida;
	end;
	
	write('El precio a abonar es : ',precio:2:0);
end.
