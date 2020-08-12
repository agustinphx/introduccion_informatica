//Un acopiador paga por tonelada según el cereal
//Trigo $ 38
//Girasol $ 56
//Soja $ 67
//Si el porcentaje de humedad es mayor al 10%, el importe abonado sufre una quita del 8%.
//Determine los datos que se requieren para establecer el importe a abonar por un productor que
//entrega una determinada cantidad de un cereal, con la respectiva medición de humedad.
Program TP1eje2;
Var
	cereal:char;
	precio,humedad:real;
Begin
	writeln('Ingrese la tonelada a cotizar : T- Trigo / G- Girasol / S- Soja ');readln(cereal);
	write('Ingrese el % de humedad : ');readln(humedad);
	
	If(cereal = 'T') then
		precio:= 38000
	Else 
		if (cereal = 'G') then
			precio:= 56000
		Else
			precio:= 67000;
			
	If(humedad > 10) then
		precio:= precio * 0.92;
		
	write('La cotizacion es de : $',precio:2:0, ' con una humedad del :',humedad:2:0,'%');	
		
end.
