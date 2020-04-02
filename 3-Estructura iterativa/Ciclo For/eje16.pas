{Ej 16.-En una competencia participan N deportistas que se identifican con su n° de Documento
y lanzan una JABALINA.
Una vez lanzada, se registra el documento y la Distancia del lanzamiento.
Se requiere:
a) Conocer el Documento del Ganador y su Distancia.
b) Conocer la Distancia Media de la prueba.}
Program eje16;
Var
	i,N,Cont:word;
	Dni,DniM:longint;
	Media,Dis,DisMax,Acum:real;
Begin
	Cont:= 0;
	Acum:= 0;
	DisMax:= -9999;
	DniM:= -9999;
	write('Ingrese la cantidad de deportistas: ');readln(N);
	For i:= 1 to N do
	begin
		write('Ingrese el numero de DNI: ');readln(Dni);
		write('Ingrese la distancia del lanzamiento: ');readln(Dis);
		
		If (DisMax < Dis) then //Calcula la distancia maxima.
		begin	
			DisMax:= Dis;
			DniM:= Dni; // Dni ganador que obtuvo la maxima distancia.
		end;
		
		If (Dis > 0) then //Acumula y cuenta todas las distancias.
		begin
			Acum:= Acum + Dis;
			Cont:= Cont + 1;
		end;
		writeln(' ');
	end;
	Media:= Acum / Cont; //Calcula la media entre todas las distancias.
	writeln('El dni ganador es: ',DniM,' y su distancia fue: ',DisMax:4:2);
	writeln('La distancia media es: ',media:2:2);
end.
