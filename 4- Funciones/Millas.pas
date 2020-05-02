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

Function Millas(ms:integer; ds,cl:char):real;

begin
		Case ds of
			'I': ms:= ms + 5000;
			'C': ms:= ms + 1000;
		end;
		
		If (cl = 'P') then
			ms:= ms + ms * 3
		Else
			if (cl = 'B') then
				ms:= ms + ms * 2;
									
	Millas:= ms;
end;

Var 
	Dni:string[13]; 
	Mllas:integer;
	i,N,CantVI,CantP,CantB,CanT:word; 
	Des,Clas:char;
	Acum:real;
Begin
	Acum:= 0;
	write('Ingrese el dni del pasajero: ');readln(Dni);
	while (Dni <> '***') do
	begin
		CantVI:= 0;
		CantP:= 0; 
		CantB:= 0;
		CanT:= 0;
		write('Cuantas millas acumuladas tiene? ');readln(Mllas);
		write('Cuantos viajes realizo en el ultimo anio? : ');readln(N);
		For i:= 1 to N do
		begin
			write('Cual fue su destino de uno de los viajes? C- Cabotaje / I- Internacional: ');readln(Des);
			write('En que clase viajo? P- Primera / B- Business / T- Turista: ');readln(Clas);
			writeln;
			If (Des = 'I') then //Cuenta los viajes internacionales
				CantVI:= CantVI + 1;
					
			If (Clas = 'P') then //Cuenta los viajes en Primera clase
				CantP:= CantP + 1
			Else
				if (Clas = 'B') then //Cuenta los viajes en clase Business
					CantB:= CantB + 1
				Else
					CanT:= CanT + 1; //Cuenta los viajes en clase Turista.	
		Acum:=  Millas(Mllas,Des,Clas);
		end;	
		writeln('a- El pasajero con Dni: ',Dni,' tiene sus millas actualizadas a: ',Acum:2:0,' y realizo: ',CantVI,' viajes internacionales');
		writeln;
		write('Si desea finalizar  escriba *** en lugar del dni');
		writeln;
		write('Ingrese el dni: ');readln(Dni);
	end;
	writeln;		
	writeln('c- El total general de viajes por primera clase son: ',CantP);
	writeln('c- El total general de viajes por clase business son: ',CantB);
	writeln('c- El total general de viajes por clase turista son: ',CanT);
	
end.

