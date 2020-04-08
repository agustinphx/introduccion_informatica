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
	Num:byte; 
	Nom:string[10];
	i,N,Cont,Acum:word;
	Porc:real;
	arch:text;
Begin
	Cont:= 0;
	Acum:= 0;
	Assign(arch,'Notas.txt');reset(arch);
	readln(arch,N);	
	While not eof (arch) do
	begin	
		For i:= 1 to N do
		begin
			read(arch,Nom);
			readln(arch,Num); //Hay que arreglar la lectura a partir de la segunda linea			
			If (Num > 5) then
			begin	
				writeln(Nom);
				writeln(Num);
				Acum:= Acum + Num;
				Cont:= Cont + 1;
			end;
		end;
	end;
	close(arch);
	writeln(' ');
	writeln('La nota acumulada es : ',Acum);
end.


