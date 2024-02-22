//Ingresar dos variables numéricas enteras: MES y DIA e informar a qué quincena (1ra o 2da) y trimestre pertenecen.
Program quincena;
Var
	mes,dia:byte;
Begin
	write('Ingrese el mes : ');readln(mes);
	If(mes >= 1) and (mes <= 3) then
		write('Corresponde al primer trimestre');

	If(mes > 3) and (mes <= 6) then
		write('Corresponde al segundo trimestre');

	If(mes > 6) and (mes <= 9) then
		write('Corresponde al tercer trimestre');

	If(mes > 9) and (mes <= 12) then
		write('Corresponde al cuarto trimestre');
		
	writeln(' ');
	writeln(' ');
	
	write('Ingrese el dia : ');readln(dia);
	If(dia >= 1 ) and (dia <= 15) then
		write('En la primera quincena');

	If(dia > 15) and (dia <= 31) then
		write('En la segunda quincena');

end.
