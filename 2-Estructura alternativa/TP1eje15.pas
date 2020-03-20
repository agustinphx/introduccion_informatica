{Se prueba un medicamento en un conjunto de pacientes y se registran cantidad de pacientes
con resultados positivos, cantidad de pacientes con resultados negativos (empeoraron ) y
cantidad de resultados neutros.
Informe el resultado de la prueba de acuerdo al siguiente criterio
- Exitosa: Si mejoraron más de los que empeoraron y los neutros. Y además los que empeoraron
son menos que los neutros.
- Neutra: Si los que mejoraron son más que los que empeoraron y los neutros.
- Fracasada: En cualquier otro caso.
Además calcule e informe porcentaje de positivos sobre los no negativos.
Determine los datos que se requieren para resolver el ejercicio}
Program TP1eje15;
Var
	Positivos,Negativos,Neutros,Suma:integer;
	porcentaje:real;
Begin
	write('Ingrese la cantidad de pacientes con resultados positivos: ');readln(Positivos);
	write('Ingrese la cantidad de pacientes con resultados negativos: ');readln(Negativos);
	write('Ingrese la cantidad de pacientes con resultados neutros  : ');readln(Neutros);
	Suma:= Negativos + Neutros;
	writeln(' ');
	
	If (Positivos > Suma) and (Negativos < Neutros) then
		writeln('Es una medicina exitosa')
	Else if (Positivos > Suma) then
		writeln('Es una medicina neutra')
	Else if (Positivos <= Suma) then
		writeln('Es una medicina fracasada');
		
	If (Positivos <= Neutros ) then
		porcentaje:= (Positivos * Neutros) /100 
	Else if (Positivos > Neutros) then
		porcentaje:= (Positivos * Neutros) /100;
		
	writeln(' ');
	writeln('El porcentaje de positivos sobre los no negativos es del: ',porcentaje:2:0,' %');
end.
