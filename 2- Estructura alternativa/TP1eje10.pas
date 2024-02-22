{Una empresa de telefonía premia con puntos a sus clientes de acuerdo al consumo registrado
en el mes anterior. Los puntos permiten retirar diferentes artículos de un catálogo.
Por cada
100 llamadas locales corresponden 25 puntos
20 llamadas interurbanas acreditan 15 puntos
5 llamadas internacionales otorgan 3 puntos
Si alguna de las categorías duplica el mínimo para la obtención de puntos recibe 5 puntos más.
Si acreditan puntos en las tres categorías reciben un plus de 5 puntos
Determine los datos que se requieren para calcular los puntos de un cliente }
Program TP1eje10;
Var
	puntos,locales,interurbanas,internacionales:longint;
Begin
	write('Cuantas llamadas locales realizo? : ');readln(locales);
	write('Cuantas llamadas interurbanas realizo? : ');readln(interurbanas);
	write('Cuantas llamadas internacionales realizo? : ');readln(internacionales);
	 
	{Case locales of  // Creo que es mas eficiente con el case, con ambas soluciones compila bien.
		100..199: puntos:= 25;
		200..399: puntos:= 30;
	end;
	Case interurbanas of
		20..39: puntos:= 15;
		40..79: puntos:= 20;
	end;
	Case internacionales of
		5..9: puntos:= 3;
		10..19: puntos:= 8;
	end;}
	
	If (locales >=100) and (locales < 200) then
		puntos:= 25
	Else 
		if (locales >= 200) then
			puntos:= 30
		Else
			if (interurbanas >= 20) and (interurbanas <= 39) then
				puntos:= 15
			Else 
				if (interurbanas >= 40)  then	
					puntos:= 20
				Else 
					if (internacionales >= 5) and (internacionales <= 9) then
						puntos:= 3
					Else
						if (internacionales >= 10) then
							puntos:= 8
						Else 
							puntos:= puntos + 5;
	
	write('Los puntos del cliente son : ',puntos);
end.
