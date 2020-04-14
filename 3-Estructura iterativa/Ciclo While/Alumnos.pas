{-Se tiene informacion sobre N alumnos y sus notas.
Nombre,Notas.
Se pide ingresar dichos datos,calcular e informar:
a- El nombre y promedio de cada uno de los N alumnos
b- Nombre del alumno con el mejor promedio.}
Program alumnos;
Var
	Alumno,MejorAlumno:string[10];
	Nota,NotaTotal:byte;
	i,N,ContN:word;
	Prom,MejorProm:Real;
	Arch:text;
begin
	MejorProm:= 0;
	Assign(Arch,'Alumnos.txt');reset(Arch);
	readln(Arch,N);
	While not Eof (Arch) do
	begin
		NotaTotal:= 0;
		ContN:= 0;
		read(Arch,Alumno);
		For i := 1 to N do 
		begin
			If (i <> N) then
				read(Arch,Nota) // Para que me lea todas las notas todas tienen que tener al menos N = 4,osea, 4 notas por cada alumno, sino da error 106 de lectura de archivo.
			Else
				readln(Arch,Nota);
				
			If (Nota > 0) then //Cuenta
				ContN:= ContN + 1;
		
			NotaTotal:= NotaTotal + Nota; 
		end;	
		Prom:= NotaTotal / ContN; //Calcula el promedio.
		
		If (Prom > MejorProm) then
		begin
			MejorProm:= Prom;
			MejorAlumno:= Alumno;
		end;
		writeln(Alumno,' promedio: ',Prom:2:2);
	end;
	close(Arch);
	writeln('El mejor promedio fue: ',MejorProm:2:2,' del alumno: ',MejorAlumno);
end.
