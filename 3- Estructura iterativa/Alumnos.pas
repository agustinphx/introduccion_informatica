{-Se tiene informacion sobre N alumnos y sus notas.
Nombre,Notas.
Se pide ingresar dichos datos,calcular e informar:
a- El nombre y promedio de cada uno de los N alumnos
b- Nombre del alumno con el mejor promedio.}
Program alumnos;
Var
	Alumno,MaxA:string[10];
	Nota,NotaTotal:byte;
	i,N,ContN:word;
	Prom,Max:Real;
	Arch:text;
begin
	Max:= 0; //Debemos inicializar esta fuera del ciclo para calcular bien el mejor promedio.
	Assign(Arch,'Alumnos.txt');reset(Arch);
	readln(Arch,N);
	While not Eof (Arch) do
	begin
		NotaTotal:= 0;// Debe ser inicializada dentro del ciclo para sumar todas las notas correctamente.
		ContN:= 0; //Si no lo inicializamos dentro del ciclo entonces no va contar bien las notas de cada alumno.
		read(Arch,Alumno);
		For i := 1 to N do 
		begin
			If (i <> N) then // Para que me lea todas las notas la variable inicial i debe ser <> N,asi es como, me lee 4 notas por cada alumno, sino da error 106 de lectura de archivo.
				read(Arch,Nota) 
			Else
				readln(Arch,Nota); //Cuando termina de leer las 4 notas de cada alumno, salta de linea para leer las 4 notas del siguiente alumno.
				
			If (Nota > 0) then //Cuenta
				ContN:= ContN + 1;
		
			NotaTotal:= NotaTotal + Nota; //Conteo de todas las notas de cada alumno.
		end;	
		Prom:= NotaTotal / ContN; //Calcula el promedio.
		
		If (Prom > Max) then //Calcula el mejor promedio y nombre del alumno.
		begin
			Max:= Prom;
			MaxA:= Alumno;
		end;
		writeln(Alumno,' promedio: ',Prom:2:2);
	end;
	close(Arch);
	writeln('El mejor promedio fue: ',Max:2:2,' del alumno: ',MaxA);
end.
