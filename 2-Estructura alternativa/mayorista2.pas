//Una empresa mayorista aplica descuentos progresivos de acuerdo a cantidad de unidades compradas.
//El precio es de $1 c/u.
//- Más de 100 y hasta 500 unidades  5%.
//- Más de 500 y hasta 2000 unidades  7%.
//- Más de 2000 y hasta 10.000 unidades  10%.
//- Más de 10.000  15%.
//Desarrollar un programa que lea el precio y la cantidad e informe el importe a abonar.
Program mayorista;
Var
	unidades:integer;
	precio:real;
Begin
	write('Ingrese la cantidad de unidades que desea comprar : ');readln(unidades);
	
	If (unidades > 100) and (unidades <= 500) then
		precio:= unidades * 0.95

	Else if (unidades > 500) and (unidades <= 2000) then
		precio:= unidades * 0.93

	Else if (unidades > 2000) and (unidades <= 10000) then
		precio:= unidades * 0.9

	Else if (unidades > 10000) then
		precio:= unidades * 0.85;

	write('El precio a abonar es : ',precio:2:0);
end.
