{La oficina meteorológica calcula la sensación térmica de acuerdo a la temperatura, humedad,
dirección (N, S, E, O) y velocidad del viento.
 Si la velocidad del viento es menor 10 km/h, la sensación coincide con la temperatura
 Si es mayor o igual a 10 km/h y la dirección es S ó O la sensación es 3 grados menos que
la temperatura, en cambio si la dirección es N ó E es 1 grado menos.
 Cuando el viento incide en el calculo, si la humedad es mayor al 50% la sensación
disminuye en un grado mas.
Determine los datos que se requieren para calcular la sensación térmica}
Program TP1eje12;
Var
	temperatura,humedad,velocidad:byte;
	direccion:char;
	
Begin
	write('Cual es la velocidad del viento en km/h : ');readln(velocidad);
	write('Cual es la direccion del viento?  N / S / E / O : ');readln(direccion);
	write('Ingrese la temperatura: ');readln(temperatura);
	write('Ingrese el % de la humedad: ');readln(humedad);
	
	If (velocidad < 10) then
		write('La sensacion termica es: ',temperatura,'º C')
	Else 
		if (velocidad >= 10) and (humedad <= 50) and (direccion = 'S') or (direccion = 'O') then
			write('La sensacion termica es: ',temperatura - 3,'º C')
		Else
			if (velocidad >= 10) and (humedad > 50) and (direccion = 'S') or (direccion = 'O') then
				write('La sensacion termica es: ',temperatura - 4,'º C')	
			Else
				if (velocidad >= 10) and (humedad <= 50) and (direccion = 'N') or (direccion = 'E') then
					write('La sensacion termica es: ',temperatura - 1,'º C')	
				Else 
					write('La sensacion termica es: ',temperatura - 2,'º C');
end.
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

