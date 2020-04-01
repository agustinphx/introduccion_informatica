{15-En un entrenamiento de ciclismo cada participante, efectúa una vuelta a la pista y al
terminar la misma se registra el nombre (*** fin de datos), la velocidad máxima alcanzada y
sus pulsaciones.
Se pide desarrollar un programa Pascal que lea de teclado los datos mencionados, obtenga e
informe:
 La categoría de cada ciclista y su nivel de riesgo
 La cantidad de participantes en cada categoría
 El porcentaje de participantes cuyo de nivel de riesgo es 3
Hasta 120 pulsaciones  nivel riesgo 1
Entre 121 y 160 nivel 2
Mas de 160  nivel 3

Velocidad: mas de 50kmh categoria A
* 		   entre 40 y 45km/h categoria B
* 			menos de 40km/h categoria C}
Program eje15;
Var
	ContA,ContB,ContC,N,i,Rtres:word;
	vel,pul:SmallInt;
	PorcTres:real;
Begin
	ContA:= 0;
	ContB:= 0;
	ContC:= 0;
	Rtres:= 0;
	write('Ingrese la cantidad de participantes: ');readln(N);
	For i:= 1 to N do
	begin
		writeln(' ');
		write('Cuantas pulsaciones tuvo? ');readln(pul);
		write('Cual fue su velocidad maxima en km/h? ');readln(vel);	
		If (pul <= 120) then
		begin
			write('Este ciclista pertenece al nivel de riesgo 1');
		end
		Else
			if (pul <= 160) then
			begin
				write('Este ciclista pertenece al nivel de riesgo 2');
			end
			Else
			begin
				Rtres:= Rtres + 1;
				write('Este ciclista pertenece al nivel de riesgo 3');
			end;
		If (vel > 50) then
		begin
			write(', su categoria es la A');
			ContA:= ContA + 1;
			writeln(' ');
		end
		Else
			if (vel > 40) and (vel <= 49) then // Si ponia ponia solo <= 49 nunca entraba en la categoria C.
			begin
			write(', su categoria es la B');
			ContB:= ContB + 1;
			writeln(' ');
			end
			Else
			begin
				write(', su categoria es la C');
				ContC:= ContC + 1;
				writeln(' ');
			end;
		end;
	PorcTres:= Rtres / N *100;
	writeln(' ');
	writeln('La cantidad de participantes en la categoria A son: ',ContA);
	writeln('La cantidad de participantes en la categoria B son: ',ContB);
	writeln('La cantidad de participantes en la categoria C son: ',ContC);
	writeln('El porcentaje de participantes con nivel de riesgo 3 es: ',PorcTres:2:0,' %');	
	
	
	
end.
