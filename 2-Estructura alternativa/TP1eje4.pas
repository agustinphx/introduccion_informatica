{Una empresa transportista clasifica el tamaño de las cargas (son cubos) según el peso y la
medida de un lado, de la siguiente forma:
- Grande si el peso es mayor a 10 kg y el lado mide mas de 90 cm.
- Medianos si pesa mas de 5kg y hasta 10 inclusive y el lado mide menor o igual de 90 cm.
- Chico si es menor o igual e 5 kg. Y el lado mide menos de 50 cm.
Se pide leer las especificaciones de una carga e informar la clasificación correspondiente, o “no
clasifica”. Además en el caso de que clasifique informar cuanto debe abonar teniendo en cuenta
que se cobra $5, $3 y $2.5 por kilo respectivamente a las categorías mencionadas.
Determine los datos que se requieren para calcular la clasificación y costo de una carga}
Program transportista;
Var
	peso,lado:longint;
	precio:real;
Begin
	write('Ingrese el peso de la carga : ');readln(peso);
	write('Ingrese la medida en cm de un lado del cubo : ');readln(lado);
	writeln(' ');
	If (peso <= 5) and (lado < 50) then
	begin
		writeln('El tamanio de la carga es: chico');
		precio:= peso * 2.5;
	end
	Else if (peso > 5) and (peso <= 10) and (lado <= 90) then
	begin
		writeln('El tamanio de la carga es: mediano');
		precio:= peso * 3;
	end
	Else if (peso > 10) and (lado > 90) then
	begin
		writeln('El tamanio de la carga es: grande');
		precio:= peso * 5;
	end;
	writeln(' ');
	writeln('El costo de la carga es : ',precio:2:0);
end.
