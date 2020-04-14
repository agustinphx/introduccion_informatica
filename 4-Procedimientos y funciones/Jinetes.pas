{En un concurso de salto hípico los jinetes saltan con su caballo, registrándose:
ë Código de jinete
ë Altura
ë Distancia
Se determina la siguiente clasificación:
Bueno el salto donde la altura y la distancia superan los 2.5 mt (ambas).
Normal el salto donde altura o distancia superen los 2.5 mt.
Malo cualquier otra marca
Leer código, altura y distancia correspondiente a N jinetes e informe para cada uno la
correspondiente clasificación y el código de jinete del salto mas alto.
Proponga un juego de datos con N= 6.}
Program jinetes;

Function Salto(Alt,Dis,Cod:real):real;
Var
	
	i,N:word;
	Max,CodMax,Codigo:real;
begin
	Max:= 0;
	write('Ingrese la cantidad de jinetes: ');readln(N);
	For i:= 1 to N do
	begin
		writeln;
		write('Ingrese el codigo del jinete: ');readln(Codigo);
		write('Cual fue la altura de su salto? : ');readln(Alt);
		write('Cual fue la distancia de su salto? : ');readln(Dis);
		If (Alt > 2.5) and (Dis > 2.5) then // Determina que tipo de salto es en base a la altura y distancia del mismo.
		begin
			writeln('El salto es Bueno');
			CodMax:= Codigo;
		end
		Else
			if (Alt > 2.5) or (Dis > 2.5) then
				writeln('El salto es Normal')
			Else
				writeln('El salto es malo');
		
		If (CodMax < Alt) then //Calcula el codigo del salto mas alto en base a la altura.
			CodMax:= Cod;
			
		If (CodMax < Dis) then //Calcula el codigo del salto mas alto en base a la distancia.
			CodMax:= Cod;
			
		If (Alt > Max) then //Calcula el salto mas alto en base a la altura.
			Max:= Alt;
				
		if (Dis > Max) then //Calcula el salto mas alto en base a la distancia.
			Max:= Dis;
	end;
	writeln;
	writeln('El salto mas alto es fue de: ',Max:2:0,' con el codigo: ',CodMax:2:2);
end;

Var
	Alt,Dis,Cod:real;
	
Begin
	Salto(Alt,Dis,Cod);
end.
