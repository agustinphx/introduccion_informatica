{Durante el transcurso de una materia cada alumno desarrolla N trabajos
prácticos.
Un alumno aprueba si el promedio de sus N prácticos es >=4 y solo se puede
desaprobar un único práctico.
En un archivo se ha registrado:
 el nombre de cada alumno
 junto con las notas de los N prácticos
Se pide leer el archivo, calcular e informar:
a) Porcentaje de alumnos que aprobaron la materia.
b) Cantidad de alumnos que no aprobaron por tener más de un práctico
desaprobado. (aún teniendo promedio>=4).
c) Nombre del alumno con mejor promedio.}
Program materias;
Var
	Nota,DesaprobadosPorTP,TPDesaprobados,Aprobados,TotalAlumnos,NotaTotal:byte; 
	Alumno,MejorAlumno:string[10];
	i,N:word;
	Prom,MejorPromedio,Porc:real;
	arch:text;
Begin
	Aprobados:= 0;
	DesaprobadosPorTP:= 0;
	TotalAlumnos:= 0;
	MejorPromedio:= 0;
	
	Assign(arch,'Notas.txt');reset(arch);
	readln(arch,N);	
	While not eof (arch) do
	begin	
		NotaTotal:= 0;
		TPDesaprobados:= 0;
		read(arch,Alumno);
		For i:= 1 to N do
		begin
			If (i <> N) then
				read(arch,Nota)
			Else
				readln(arch,Nota);
				
			If (Nota < 4) then // Si la nota es menor a 4 el trabajo practico esta desaprobado.
				TPDesaprobados:= TPDesaprobados + 1;
				
			NotaTotal:= NotaTotal + Nota; //Sumamos las notas para luego calcular el promedio.
		end;
		Prom:= NotaTotal / N;
		
		If (Prom >= 4) and (TPDesaprobados <= 1) then //Evaluamos si el alumno esta aprobado.
			Aprobados:= Aprobados + 1;
			
		If (TPDesaprobados > 1) then //Evaluamos si el alumno desaprobo por tener un tener mas de un tp desaprobado.
			DesaprobadosPorTP:= DesaprobadosPorTP + 1;
			
		If (Prom > MejorPromedio) then
		begin
			MejorPromedio:= Prom;
			MejorAlumno:= Alumno;
		end;
		
		TotalAlumnos:= TotalAlumnos + 1; //Cuenta la cantidad total de alumnos antes de terminar de recorrer el cilo.
		Porc:= (Aprobados / TotalAlumnos) * 100; //Calcula el porcentaje de aprobados.
	end;
	close(arch);
	writeln(' ');		
	writeln('Alumnos aprobados: ',Porc:6:2,' %');
	writeln('Alumnos que desaprobaron por tener mas de un TP desaprobado: ',DesaprobadosPorTP);
	writeln(MejorAlumno,'obtuvo el mejor promedio con un: ',MejorPromedio:6:2);
end.


