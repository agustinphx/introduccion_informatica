{15-En un entrenamiento de ciclismo cada participante, efectúa una vuelta a la pista y al
terminar la misma se registra el nombre (*** fin de datos), la velocidad máxima alcanzada y
sus pulsaciones.
Hasta 120 pulsaciones  nivel riesgo 1
Entre 121 y 160 nivel 2
Mas de 160  nivel 3

Velocidad: mas de 50kmh categoria A
 		   entre 40 y 45km/h categoria B
 			menos de 40km/h categoria C
Se pide desarrollar un programa Pascal que lea de teclado los datos mencionados, obtenga e
informe:
a. Promedio de velocidades máximas
b. Cantidad de corredores de categoría A con nivel de riesgo 1
c. Informar categorías sin participantes}
Program eje15b;
Var
	Cont,ContV,ContA,ContB,ContC,N,i,SumA,SumV:word;
	vel,pul,velMax:SmallInt;
	Prom:real;
Begin
	Cont:= 0;
	ContV:= 0;
	ContA:= 0;
	ContB:= 0;
	ContC:= 0;
	SumA:= 0;
	velMax:= -9999;
	SumV:= 0;
	write('Ingrese la cantidad de participantes: ');readln(N);
	For i:= 1 to N do
	begin
		writeln(' ');
		write('Cuantas pulsaciones tuvo? ');readln(pul);
		write('Cual fue su velocidad maxima en km/h? ');readln(vel);
				
		If (pul <= 120) and (vel > 50) then //Cuenta exclusivamente la cantidad de ciclistas de categoria A con nivel de riesgo 1.
			Cont:= Cont + 1;
	
		If (vel > 50) then //Empezamos a contar,si cumple la condición, los ciclistas de cada categoria independiente del nivel de riesgo.
		begin
			ContA:= ContA + 1;
			SumA:= SumA + vel;
		end
		Else 
			if (vel > 40) and (vel <= 49) then  //Si no ponia el > 40 nunca entraba a sumar en el ContC.
				ContB:= ContB + 1
			Else
				ContC:= ContC + 1; 
				
		If (velMax < vel) then //Calcula las velocidades maximas
		 begin	
		 	velMax:= vel;
		 	SumV:= SumV + vel;
		 	ContV:= ContV + 1;
		 end;		 
	end;
	writeln(' ');
	If (ContA = 0) then //Si al finalizar el ciclo,una vez que ya se ingresaron los datos, no se contaron ciclistas de alguna categoria entonces imprimimos que no hay participantes en dicha categoria.
		begin
			ContA:= ContA;
			writeln('La categoria A no tiene participantes');
		end
		Else
			if (ContB = 0) then 
			begin
				ContB:= ContB;
				writeln('La categoria B no tiene participantes');
			end
			Else
			begin
				ContC:= ContC; 
				writeln('La categoria C no tiene participantes');
			end;

	Prom:= SumV/ ContV; // Promedio de las velocidades maximas.
	writeln('El promedio de velocidades maximas es: ',Prom:2:0);
	writeln('La cantidad de corredores de categoria A con nivel de riesgo 1 son: ',Cont);
		
end.
