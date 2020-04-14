{Una aerolínea debe actualizar las millas acumuladas por sus clientes en los
viajes que han realizado el último año. Por cada uno de ellos registró:
• DNI (cadena de 13, *** fin de clientes)
• Millas acumuladas (hasta el momento, entero)
• Cantidad de viajes realizados (en el último año)
Y a continuación para el mismo cliente por cada uno de sus viajes:
• Destino (C-cabotaje; I- internacional)
• Clase (P-primera; B- business; T-turista)
Se pide leer los datos descriptos para informar:
a. De cada pasajero el DNI, el millaje actualizado y total de viajes
internacionales.
b. DNI del cliente cuyas millas en el último año representan el mayor % con
respecto a las que tenía acumuladas anteriormente.
c. Total general de viajes por cada clase.
Las millas por viaje se otorgan de la siguiente manera:
 1000 si es de cabotaje y 5000 si es internacional.
 Se triplica si es 1primera clase y se duplica si es business .
Desarrollar y utilizar en la solución una función Millas con los parámetros que
considere necesarios para calcular las millas obtenidas en un viaje}
Program millas;

{Function Millas(AcuM:integer):integer; //Hay que revisar la funcion porque no lee el valor final de Millas.
Var //Variables locales.
	Ac:integer;
	Des,Clas:char;
begin
	Ac:= 0;
	Case Des of
		'I': Ac:= Ac + 5000;
		'C': Ac:= Ac + 1000;
	end;
	
	Case Clas of
		'P': Ac:= Ac * 3;
		'B': Ac:= Ac * 2;
	end;
	
	Millas:= Ac;
end;}


Var //Variables globales
	AcuM,Dni:Longint; 
	i,j,N,CantV,CantVI,CantP,CantB,CanT:word; 
	Des,Clas:char;
begin
	AcuM:= 0;
	CantV:= 0;
	CantVI:= 0;
	CantP:= 0;
	CantB:= 0;
	CanT:= 0;
	write('Ingrese la cantidad de pasajeros: ');readln(N);
	For i:= 1 to N do
	begin
		writeln;
		write('Ingrese el DNI: ');readln(Dni);
		write('Cuantas millas acumuladas tiene? ');readln(AcuM);
		write('Cuantos viajes realizo en el ultimo anio? ');readln(CantV);
		For j:= 1 to CantV do
		begin
			write('Cual fue su destino de uno de los viajes? C- Cabotaje / I- Internacional: ');readln(Des);
			write('En que clase viajo? P- Primera / B- Business / T- Turista: ');readln(Clas);
			
			If (Des = 'I') then //Cuenta los vuelos internacionales.
			CantVI:= CantVI + 1;
			
			If (Clas = 'P') then //Cuenta los vuelos en primera clase.
				CantP:= CantP + 1
			Else
				if (Clas = 'B') then //Cuenta los vueltos en clase business.
					CantB:= CantB + 1
				Else
					CanT:= CanT + 1; //Cuenta los vuelos en clase turista.
					
			Case Des of //Calcula la cantidad de millas segun el destino.
				'I': AcuM:= AcuM + 5000;
				'C': AcuM:= AcuM + 1000;
			end;
		
			Case Clas of //Calcula la cantidad de millas segun la clase del viaje.
				'P': AcuM:= AcuM * 3;
				'B': AcuM:= AcuM * 2;
			end;
	end;
	writeln;		
	writeln('El pasajero con Dni: ',Dni,' tiene sus millas actualizadas a: ',AcuM,' con un total de: ',CantVI,' de vuelos internacionales');
	end;
	writeln('El total general de viajes por primera clase son: ',CantP);
	writeln('El total general de viajes por clase business son: ',CantB);
	writeln('El total general de viajes por  clase turista son: ',CanT);
	
	//writeln('Cantidad de millas actualizadas: ',Millas(AcuM)); 

end.

