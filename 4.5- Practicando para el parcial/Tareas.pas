{En una empresa de Software, los N miembros del equipo de desarrollo se reúnen semanalmente
para planificar su trabajo.
Cada miembro elige, entre las tareas pendientes, la cantidad que considera
que podrá desarrollar en las 20 horas laborales que dispone en la semana y
estima el tiempo en horas que le llevará resolver cada una. Al finalizar la
semana se registra el tiempo real que se ocupó en desarrollar cada tarea.
Relación: 1 h -> 1 ½ h -> 0.5
Los datos vienen en el archivo Tareas.TXT con el siguiente formato,
 Nombre
 Y a continuación:
o Tiempo estimado (0=Fin)
o Tiempo real
Se pide desarrollar un programa Pascal, eficaz, claro y eficiente que ingrese los
datos de cada miembro para calcular e informar:
a) Por cada miembro del equipo el tiempo real que le insumió resolver la
tarea con mayor estimación y la calificación que obtuvo según su
rendimiento (*) .
b) Los Nombres del que menos y el Nombre del que más tiempo Real le
llevó resolver una tarea y cuál fue el tiempo estimado
(*)Desarrollar la función Rendimiento con los parámetros que considere necesarios para calificar
a un desarrollador, sabiendo que se califica al integrante del equipo, según el tiempo total real
respecto al total de horas laborales :
‘E’=Excelente si T<= 0 , ‘M’=Muy Bueno 0 < T <= 3 horas
‘B’=Bueno 3 < T <= 5 y ‘R’=Regular si T > 5}
Program Tareas;
{Function Rendimiento(TiempoET,TiempoRT:real):char;
Var
	Ren:char;
	aux:real;
begin
	aux:= TiempoET - TiempoRT;
	If (aux <= 0) then
		Ren:= 'E'
	Else
		if (aux <= 3) then
			Ren:= 'M'
		Else
			if (aux <= 5) then
				Ren:= 'B'
			Else
				Ren:= 'R'
	Rendimiento:= Ren;
end;}

Var
	Nom,MinNom,MaxNom:string[8];
	//Ren:char;
	i,N:byte;
	TiempoE,TiempoR,MaxE,MaxR,MinE,MinR,Ren,TiempoET,TiempoRT:real;
	arch:text;
Begin
	MinR:= 999;
	MinE:= 999;
	assign(arch,'Tareas.txt');reset(arch);
	readln(arch,N);
	For i:= 1 to N do
	begin
		MaxR:= 0;
		MaxE:= 0;
		TiempoET:= 0;
		TiempoRT:= 0;
		readln(arch,Nom);
		read(arch,TiempoE);
		while (TiempoE <> 0) do
		begin
			readln(arch,TiempoR);
			TiempoET:= TiempoET + TiempoE;
			TiempoRT:= TiempoRT + TiempoR;	
			If(TiempoE > MaxE) then
			begin
				MaxE:= TiempoE;
				MaxR:= TiempoR;
				MaxNom:= Nom;
			end;
			If (TiempoR < MinR) then
			begin	
				MinE:= TiempoE;
				MinR:= TiempoR;
				MinNom:= Nom;
			end;
			read(arch,TiempoE);
		end;
		Ren:= TiempoRT - TiempoET;
		{Ren:= Rendimiento(TiempoET,TiempoRT);
		If (Ren = 'E') then
				writeln('El rendimiento es Excelente')
			Else
			if (Ren = 'M') then
				writeln('El rendimiento es Muy Bueno')
			Else
				if (Ren = 'B') then
					writeln('El rendimiento es Bueno')
				Else
					writeln('El rendimiento es Regular');}				
		writeln(Nom,' maximo estimado: ',MaxE:2:0,' y un maximo real: ',MaxR:2:0,' con una diferencia en los totales de: ',Ren:2:0);
		If (Ren  <= 0) then
				writeln('a- El rendimiento es Excelente')
			Else
			if (Ren  <= 3) then
				writeln('a- El rendimiento es Muy Bueno')
			Else
				if (Ren <= 5) then
					writeln('a- El rendimiento es Bueno')
				Else
					writeln('a- El rendimiento es Regular');
		writeln;
		readln(arch);
	end;
	close(arch);
	writeln;
	writeln('b- ',MaxNom,' le llevo mas tiempo resolver, con un tiempo real de: ',MaxR:2:0,' y un tiempo estimado de: ',MaxE:2:0);
	writeln('b- ',MinNom,' le llevo menos tiempo resolver, con un tiempo  real de: ',MinR:2:0,' y un tiempo estimado de: ',MinE:2:0);	
end.

