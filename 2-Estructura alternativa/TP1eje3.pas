//Conociendo el peso de una persona (nro. real), informar el estado de la misma de acuerdo con el siguiente criterio
//peso < 40 ‘DELGADA’
// 40≤ peso < 60 ‘NORMAL’
// 60≤ peso < 80 ‘SOBREPESO’
// 80≤ peso ‘OBESA’
//Además informar y determinar la talla que le corresponde según las siguientes condiciones:
//Talle 1 peso <= 50
//Talle 2 50 < peso <= 80
//Talle 3 80 < peso
Program TP1eje3;
Var
	peso:longint;//Si le asignamos real no compila.
	
Begin
	write('Ingrese el peso de la persona : ');readln(peso);
	
	Case peso of
		1..39: write('Es una persona delgada');
		40..59: write('Es una persona normal');
		60..79: write('Es una persona con sobrepeso');
		80..200: write('Es una persona obesa');
	end;
	
	If (peso <= 50) then
		writeln(' , talle 1')	
	Else
		if (peso <= 80) then
			writeln(', talle 2')		
		Else 
			writeln(', talle 3');
		
end.
