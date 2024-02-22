{En un Torneo de Arquería se presentan un conjunto de participantes y tienen todos N oportunidades.
Del torneo se conoce:
 Nombre del arquero (***=fin de datos)
 Coordenadas del punto de impacto P(x,y) de los N tiros
El Blanco tiene centro en las coordenadas C(0,0).
La zona A (más cercana) tiene un radio de 5 y la B un radio de 12.
Se pide ingresar la información, calcular e informar :
a) Para cada participante, porcentaje de aciertos en cada Zona.
b) Cuántos participantes dieron por lo menos una vez en la zona A más cercana al blanco.
Desarrollar una función EnZona que a partir del punto P(x,y) obtenga la distancia del impacto al Centro y
determine en qué zona cayó. (Distancia=Sqrt( Sqr(X-X0)+Sqr(Y-Y0)) )}
Program arqueria;

Function EnZona(x,y:byte):real;
begin
	EnZona:= sqrt( sqr(0 - x) + sqr(0 - y));
end;

Var
	Nom:string[10];
	x,y:byte;
	i,N,ContA,ContB,ContC,ContMax:word;
	PorcA,PorcB,PorC,zon:real;
Begin
	ContMax:= 0;
	write('Ingrese el nombre del arquero: ');readln(Nom);
	While (Nom <> '***') do
	begin
		ContA:= 0;
		ContB:= 0;
		ContC:= 0;
		write('Ingrese la cantidad de oportunidades: ');readln(N);
		For i:= 1 to N do
		begin
			write('Ingrese la coordenada x del lanzamiento: ');readln(x);
			write('Ingrese la coordenada y del lanzamiento: ');readln(y);
					
			zon:= EnZona(x,y);
			
			If (zon <= 5) then
			begin
				writeln('El disparo cayo en el radio de A');
				ContA:= ContA + 1;
			end
			Else
				if (zon <= 12) then
				begin
					writeln('El disparo cayo en el radio de B ');
					ContB:= ContB + 1;
				end
				Else
				begin
					writeln('El disparo cayo en el radio de C');
					ContC:= ContC + 1;
				end;
				writeln;
			end;
			
			If (x <= 5) then
					ContMax:= ContMax + 1
				Else
					if (y <= 5) then
						ContMax:= ContMax + 1;
		writeln;
		PorcA:= (ContA  / N) * 100;
		PorcB:= (ContB / N) * 100;
		PorC:= (ContC / N) * 100;
		writeln('a- ',Nom,' tuvo un porcentaje de acierto en los blancos A: ',PorcA:2:0,' %   B: ',PorcB:2:0,' %   C: ',PorC:2:0,' %');
		writeln;
		writeln('Si desea finalizar escriba *** en lugar del nombre');
		write('Ingrese el nombre del arquero: ');readln(Nom);
	end;
	writeln('b- La cantidad de participantes que dieron en la zona A mas  cercana del blanco son: ',ContMax);
end.
