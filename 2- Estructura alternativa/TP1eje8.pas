{Una entidad bancaria exige una las siguiente condiciones para otorgar un crédito a un cliente
- Es propietario de un inmueble tasado en $1000000 o mas y tiene un sueldo menor o igual a
$1000
- Es propietario de un inmueble tasado en hasta $1000000 y tiene un sueldo de mas de $1000
-No es propietario , pero tiene mas de 5 años de antigüedad en el trabajo y gana mas de $1500
mensuales.
Determine los datos que se requieren para ser merecedor de un crédito}
Program TP1eje8;
Var
	antiguedad:byte;
	inmueble,sueldo:real;
	propietario:char;
Begin
	write('Es propietario de algun inmueble ? S / N : ');readln(propietario);
	write('Cual es el valor de su inmueble ? : ');readln(inmueble);
	write('Ingrese su sueldo mensual : ');readln(sueldo);
	write('Cuantos anios tiene de antiguedad en el trabajo? : ');readln(antiguedad);
	
	If (propietario = 'S') and (inmueble >= 1000000) and (sueldo <= 1000) then
		write('Es merecedor del credito')
	Else
		if (propietario = 'S') and (inmueble < 1000000) and (sueldo > 1000) then
			write('Es merecedor del credito')	
		Else 
			if (propietario = 'N') and (antiguedad > 5) and (sueldo > 1500) then
				write('Es merecedor del credito')	
			Else 
				write('No merece el credito');
end.
	
		
