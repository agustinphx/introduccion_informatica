{A partir de la cantidad total de piezas que produce una máquina y la cantidad de piezas con
fallas de grado 1 y grado 2 dentro de ese lote de producción.
Ejemplo: en 200 piezas hay
15 con fallas de grado 1
5 con fallas de grado 2
Calcular e informarr :
a) Porcentaje de piezas falladas sobre el total de la producción.
b) Porcentaje de piezas con fallas de grado 1 sobre el total de piezas falladas.
c) Porcentaje de piezas con fallas de grado 2 sobre el total de piezas falladas.
Y a continuación informar la calidad de la producción de acuerdo al siguiente criterio:
- Muy buena: Si el porcentaje de fallas es menor al 10%.
- Buena: Si el porcentaje de fallas de grado 1 es menor al 20 %.
- Regular: Si el porcentaje de fallas de grado 1 es igual al porcentaje de fallas de grado 2.
- Mala: En cualquier otro caso
Determine los datos que se requieren para resolver el ejercicio} 
Program TP1eje13;
Var
	produccion,porcentaje,gradoUno,gradoDos:real;
Begin
	write('Ingrese la cantidad de produccion: ');readln(produccion);
	write('Ingrese la cantidad de piezas con fallas de grado 1: ');readln(gradoUno);
	write('Ingrese la cantidad de piezas con fallas de grado 2: ');readln(gradoDos);
	gradoUno:= (produccion * gradoUno) / 100;
	gradoDos:= (produccion * gradoDos) / 100;
	porcentaje:= gradoUno + gradoDos ; //Obtiene el porcentaje entre ambos grados de fallas.
	writeln(' ');
	
	If (porcentaje < 10) then
		writeln('La produccion es: Muy buena')
	Else
		if (gradoUno >= 10) and (gradoUno < 20) and not (gradoDos < 20) then
				writeln('La produccion es: Buena')
		Else 
			If (gradoUno = gradoDos) then
				writeln('La produccion es: Regular')
			Else 
				writeln('La produccion es: Mala');
		
	writeln(' ');
	writeln('El porcentaje de fallas totales es: ',porcentaje:2:0,' %');
	writeln('El porcentaje de fallas de grado 1 es: ',gradoUno:2:0,' %');
	writeln('El porcentaje de fallas de grado 2 es: ',gradoDos:2:0,' %');

end.
