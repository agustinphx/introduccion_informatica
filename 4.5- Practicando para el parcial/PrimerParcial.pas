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
Program PrimerParcial;
Function Rendimiento(TiempoET,TiempoRT:real):char;
Var
	Ren:char;
	aux:real;
begin
	aux:= TiempoRT - TiempoET;
	If (aux <= 0) then
		Ren:= 'E'
	Else
		if (aux <= 3) then
			Ren:= 'M'
		Else
			if (aux <= 5) then
				Ren:= 'B'
			Else
				Ren:= 'R';
				
	Rendimiento:= Ren;
end;

Var
	Nom,MinNom,MaxNom:string[8];
	i,N:byte;
	TiempoE,TiempoR,MaxE,MaxR,MinE,MinR,TiempoET,TiempoRT:real;
	arch:text;
Begin
	MinR:= 999;
	MinE:= 999;
	MaxR:= 0;
	MaxE:= 0;
	assign(arch,'PrimerParcial.txt');reset(arch);
	readln(arch,N);
	For i:= 1 to N do
	begin
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
		writeln(Nom,' maximo estimado: ',MaxE:2:0,' y un maximo real: ',MaxR:2:0,' y una calificacion de: ',Rendimiento(TiempoET,TiempoRT));
		writeln;
		readln(arch);
	end;
	close(arch);
	writeln;
	writeln('b- ',MaxNom,' le llevo mas tiempo resolver, con un tiempo real de: ',MaxR:2:0,' y un tiempo estimado de: ',MaxE:2:0);
	writeln('b- ',MinNom,' le llevo menos tiempo resolver, con un tiempo  real de: ',MinR:2:0,' y un tiempo estimado de: ',MinE:2:0);	
end.

