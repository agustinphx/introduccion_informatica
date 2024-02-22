{Durante el transcurso de una materia cada alumno desarrolla N trabajos
prácticos.
Un alumno aprueba si el promedio de sus N prácticos es >=4 y solo se puede
desaprobar un único práctico.
En un archivo se ha registrado:
• el nombre de cada alumno
• junto con las notas de los N prácticos
Se pide leer el archivo, calcular e informar:
a) Porcentaje de alumnos que aprobaron la materia.
b) Cantidad de alumnos que no aprobaron por tener más de un práctico
desaprobado. (aún teniendo promedio>=4).
c) Nombre del alumno con mejor promedio.}
Program Notas;
Var
	Alumno,MaxAlum:string[9];
	i,N,Nota,TPD,CantA,CantD,TotalAlumnos,NotaTotal:byte;
	Prom,Porc,MaxProm:real;
	arch:text;
Begin
	CantA:= 0;
	CantD:= 0;
	TotalAlumnos:= 0;
	MaxProm:= 0;
	assign(arch,'Alumnos.txt');reset(arch);
	readln(arch,N);
	while not eof (arch) do
	begin
		TPD:= 0;
		NotaTotal:= 0;
		readln(arch,Alumno);
		For i:= 1 to N do 
		begin
			readln(arch,Nota);
			NotaTotal:= NotaTotal + Nota;
			
			If (Nota < 4) then
				TPD:= TPD + 1;
		end;
		Prom:= NotaTotal / N;
		TotalAlumnos:= TotalAlumnos + 1;
		
		If (Prom >= 4) and (TPD <= 1) then
			CantA:= CantA + 1
		Else
			CantD:= CantD + 1;
						
		If (Prom > MaxProm) then
		begin
			MaxProm:= Prom;
			MaxAlum:= Alumno;
		end;
		Porc:= (CantA / TotalAlumnos) * 100;
		writeln(Alumno,' promedio: ',Prom:2:0);
	end;
	close(arch);
	writeln('Porcentaje de alumnos aprobados: ',Porc:2:0,' %');
	writeln('El alumno: ',MaxAlum,' obtuvo el mejor promedio con un: ',MaxProm:2:0);
end.
