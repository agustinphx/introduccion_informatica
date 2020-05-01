{Una aerolínea debe actualizar las millas acumuladas por sus clientes en los
viajes que han realizado el último año. Por cada uno de ellos registró:
• DNI (cadena de 13, *** fin de clientes)
• Millas acumuladas (hasta el momento, entero)
• Cantidad de viajes realizados (en el último año)
Y a continuación para el mismo cliente por cada uno de sus viajes:
• Destino (C-cabotaje; I- internacional)
• Clase (P-primera; B- business; T-turista)
Se pide leer los datos descriptos para informar:
a. De cada pasajero el DNI y  el millaje actualizado.
b. Total general de viajes por cada clase.
Las millas por viaje se otorgan de la siguiente manera:
 1000 si es de cabotaje y 5000 si es internacional.
 Se triplica si es primera clase y se duplica si es business .
Desarrollar y utilizar en la solución una función Millas con los parámetros que
considere necesarios para calcular las millas obtenidas.}
Program millas;

Function Millas(mllas:integer; destino,clase:char):Longint;
begin
		Case destino of
			'I': mllas:= mllas + 5000;
			'C': mllas:= mllas + 1000;
		end;	
			
		If (clase = 'P') then
			mllas:= mllas * 3
		Else
			if (clase = 'B') then
				mllas:= mllas * 2;
	Millas:= mllas;
end;

Var 
	Dni:string[13]; 
	Mllas:integer;
	CantVI,CantP,CantB,CanT:word; 
	Des,Clas:char;
Begin
	CantVI:= 0;
	CantP:= 0;
	CantB:= 0;
	CanT:= 0;
	write('Ingrese el dni del pasajero: ');readln(Dni);
	while (Dni <> '***') do
	begin
		write('Cuantas millas acumuladas tiene? ');readln(Mllas);
		write('Cual fue su destino de uno de los viajes? C- Cabotaje / I- Internacional: ');readln(Des);
		write('En que clase viajo? P- Primera / B- Business / T- Turista: ');readln(Clas);
		writeln;
			If (Des = 'I') then 
				CantVI:= CantVI + 1;
				
			If (Clas = 'P') then
				CantP:= CantP + 1
			Else
				if (Clas = 'B') then
					CantB:= CantB + 1
				Else
					CanT:= CanT + 1;			
		writeln('El pasajero con Dni: ',Dni,' tiene sus millas actualizadas a: ',Millas(Mllas,Des,Clas));
		writeln;
		write('Si desea finalizar  escriba *** en lugar del dni');
		writeln;
		write('Ingrese el dni: ');readln(Dni);
	end;
	writeln;		
	writeln('El total general de viajes por primera clase son: ',CantP);
	writeln('El total general de viajes por clase business son: ',CantB);
	writeln('El total general de viajes por  clase turista son: ',CanT);
	
end.

