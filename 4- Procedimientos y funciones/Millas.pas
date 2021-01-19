{Una aerolínea debe actualizar las millas acumuladas por sus clientes en los viajes que han realizado el
último año. Por cada uno de ellos registró:
• DNI (cadena de 8)
• Millas acumuladas (hasta el momento, entero)
Cantidad de viajes realizados y a continuación para el mismo cliente por cada uno de sus viajes:
 Destino (C-cabotaje; I- internacional)
 Clase (P-primera; B- business; T-turista)
Se pide leer los datos descriptos para informar:
a) De cada pasajero el DNI, el millaje actualizado y total de viajes internacionales.
b) DNI del cliente cuyas millas en el último año representan el mayor % con respecto a las que tenía
acumuladas anteriormente.
c) Total general de viajes por clase.
Las millas por viaje se otorgan de la siguiente manera:
- 1000 si es de cabotaje y 5000 si es internacional.
- Se triplica si es 1ra clase y se duplica si es business .
Desarrollar y utilizar en la solución una función Millas con los parámetros que considere necesarios para
calcular las millas obtenidas en un viaje}
Program Millas;

Function Millas(Des,Clas:char; Ms:integer):Integer;
Begin	
	Case Des of
		'C':Ms:= 1000;
		'I':Ms:= 5000;
	end;
	
	Case Clas of
		'P':Ms:= Ms * 3;
		'B':Ms:= Ms * 2;
	end;
	
	Millas:= Ms;
end;

Var
	Dni,MaxDni:string[8];
	Des,Clas,Esp:char;
	CantP,CantB,CanT,CantVI,i,N:byte;
	Ms,Max:integer;
	Porc:real;
	arch:text;
Begin
	CantP:= 0; // Debo inicializar estas variables contadores fuera del ciclo que las recorre porque sino realizara mal el conteo.
	CantB:= 0;
	CanT:= 0;
	assign(arch,'Millas.txt');reset(arch);
	readln(arch,N);
	For i:= 1 to N do
	begin
		Ms:= 0;
		Max:= 0;
		CantVI:= 0; //Debe ser inicializada antes del ciclo while pero dentro del for para que las cuente correctamente.
		readln(arch,Dni);
		read(arch,Ms,Esp,Des,Esp,Clas);
		while (Ms <> 0) do
		begin
			If (Des = 'I') then
				CantVI:= CantVI + 1;
				
			Case Clas of
				'P':CantP:= CantP + 1;
				'B':CantB:= CantB + 1;
				'T':CanT:= CanT + 1;
			end;			
			
			Porc:= (Ms / Millas(Des,Clas,Ms)) * 100;
			
			If (Porc > Max) then
				MaxDni:= Dni;
				
			Ms:= Ms + Millas(Des,Clas,Ms);
			writeln(Dni,' millaje actualizado a: ',Ms,' millas con ',CantVI,' viajes internacionales');
			read(arch,Ms,Esp,Des,Esp,Clas); //Debe ser read y estar al final del ciclo porque sino se saltea la primera milla de cada Dni.
		end;
		writeln;
	end;
	close(arch);
	writeln('Dni del cliente que mas incremento sus millas porcentualmente: ',MaxDni);
	writeln('Cantidad de viajes en primera clase: ',CantP);
	writeln('Cantidad de viajes en clase business: ',CantB);
	writeln('Cantidad de viajes en clase turista: ',CanT);
end.
