////Una empresa mayorista aplica descuentos progresivos de acuerdo a cantidad de unidades compradas.
//El precio es de $1 c/u.
//- Más de 100 y hasta 500 unidades  5%.
//- Más de 500 y hasta 2000 unidades  7%.
//- Más de 2000 y hasta 10.000 unidades  10%.
//- Más de 10.000  15%.
//Desarrollar un programa que lea el precio y la cantidad e informe el importe a abonar.
//Implementar la solución utilizando la sentencia CASE.
Program mayorista;
Var
	unidades:longint;
	precio:real;
Begin
	write('Ingrese la cantidad de unidades que desea comprar : ');readln(unidades);
	
	Case unidades of 
		100..500: precio:= unidades * 0.95;
		501..2000: precio:= unidades * 0.93;
		2001..10000: precio:= unidades * 0.9;
		10001..10000000 : precio:= unidades * 0.85;
	end;
	writeln('El precio a abonar es : ',precio:2:0);
end.
