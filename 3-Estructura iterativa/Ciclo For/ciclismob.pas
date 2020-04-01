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
* 			menos de 40km/h categoria C
a. Promedio de velocidades máximas
b. Cantidad de corredores de categoría A con nivel de riesgo 1
c. Informar categorías sin participantes}
Program eje15b;
Var
	Cont,ContA,ContB,ContC,N,i,SumA:word;
	vel,pul:SmallInt;
	PromA:real;
Begin
	Cont:= 0;
	ContA:= 0;
	ContB:= 0;
	ContC:= 0;
	SumA:= 0;
	write('Ingrese la cantidad de participantes: ');readln(N);
	For i:= 1 to N do
	begin
		writeln(' ');
		write('Cuantas pulsaciones tuvo? ');readln(pul);
		write('Cual fue su velocidad maxima en km/h? ');readln(vel);	
		If (pul <= 120) then
		begin
			writeln('Este ciclista pertenece al nivel de riesgo 1');
		end
		Else
			if (pul <= 160) then
				writeln('Este ciclista pertenece al nivel de riesgo 2')
			Else
				writeln('Este ciclista pertenece al nivel de riesgo 3');
				
		If (pul <= 120) and (vel > 50) then //Cuenta la cantidad de corredores de categoria A con nivel de riesgo 1.
			Cont:= Cont + 1;
			
		If (vel > 50) then //Cuenta solamente la categoria A independiente del nivel de riesgo.
		begin
			ContA:= ContA + 1;
			SumA:= SumA + vel;
		end
		Else 
			if (vel > 40) and (vel <= 49) then //Cuenta solamente la categoria B independiente del nivel de riesgo.
				ContB:= ContB + 1
			Else
				ContC:= ContC + 1; //Cuenta solamente la categoria C independiente del nivel de riesgo.
	end;
	writeln(' ');
	If (ContA = 0) then //Si al finalizar el ciclo,una vez que ya se ingresaron los datos, no se contaron ciclistas de la categoria A entonces imprimimos que no hay participantes en dicha categoria.
		begin
			ContA:= ContA;
			writeln('La categoria A no tiene participantes');
		end
		Else
			if (ContB = 0) then //Si al finalizar el ciclo,una vez que ya se ingresaron los datos, no se contaron ciclistas de la categoria B entonces imprimimos que no hay participantes en dicha categoria.
			begin
				ContB:= ContB;
				writeln('La categoria B no tiene participantes');
			end
			Else
			begin
				ContC:= ContC; //Igual que con las dos categorias anteriores.
				writeln('La categoria C no tiene participantes');
			end;

	PromA:= SumA / ContA; // Promedio de las velocidades maximas.
	writeln('El promedio de velocidades maximas es: ',PromA:2:0);
	writeln('La cantidad de corredores de categoria A con nivel de riesgo 1 son: ',Cont);
		
end.
