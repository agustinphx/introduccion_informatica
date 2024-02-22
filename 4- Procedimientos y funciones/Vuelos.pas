{Se tiene información sobre el equipaje de un conjunto de vuelos grabada en un
archivo de texto, de la siguiente forma:
En la misma línea:
 código (si no se usa archivo, indicar con *** fin de vuelos)
 cantidad de pasajeros,
y a continuación para el mismo vuelo una línea por cada pasajero:
 Categoría (A, B, C)
 Peso (en kgs. del equipaje)
Se pide leer la información descripta, calcular e informar:
a) De cada pasajero kilos excedidos
b) De cada vuelo, total de sobrepeso en cada categoría
c) De todos los vuelos, el código de vuelo de mayor sobrepeso
Utilizar la función SOBREPESO, que con los parámetros que considere
necesarios devuelva el correspondiente sobrepeso de acuerdo a la siguiente
escala:
Categoría Peso permitido hasta
A 40
B 30
C 23
}
Program vuelos;

Function SobrePeso(Cat:char; Peso:byte):byte;
Var
	Aux:byte;
Begin
	Aux:= 0; //Utilizo una variable auxiliar para ahorrarme de escribir el nombre completo de la funcion.
	If (Cat = 'A') and (Peso > 40) then
		Aux:= Peso - 40
	Else
		if (Cat = 'B') and (Peso > 30) then
			Aux:= Peso - 30
		Else
			if (Cat = 'C') and (Peso > 23) then
				Aux:= Peso - 23
			Else
				Aux:= 0;
				
	SobrePeso:= Aux
end;

Var
	Cod,MaxCod:string[3];
	Cat,Espacio:char;
	CantP,Peso,SP:byte;
	i,SobrePA,SobrePB,SobrePC,SobrePT,MaxSP:word;
	Arch:text;
Begin
	MaxSP:= 0;
	Assign(Arch,'Vuelos.txt');reset(Arch);
	while not eof (Arch) do
	begin
		SobrePA:= 0; //Reseteo los valores de cada sobrepeso.
		SobrePB:= 0;
		SobrePC:= 0;
		SobrePT:= 0;
		readln(Arch,Cod,Espacio,CantP);
		writeln('Vuelo: ',Cod);
		For i:= 1 to CantP do
		begin	
			readln(Arch,Cat,Espacio,Peso);
			SP:= SobrePeso(Cat,Peso); //Renombro la funcion para mayor comodidad.
			
			Case Cat of
				'A':SobrePA:= SobrePA + SP;
				'B':SobrePB:= SobrePB + SP;
				'C':SobrePC:= SobrePC + SP;
			end;
			writeln('a- Sobrepeso del pasajero ',i,' :',SP);
		end;
		writeln;
		writeln('b- Sobrepeso en categoria A: ', SobrePA);
        writeln('b- Sobrepeso en categoria B: ', SobrePB);
        writeln('b- Sobrepeso en categoria C: ', SobrePC); 
		
		SobrePT:= SobrePA + SobrePB + SobrePC;
		
		If (SobrePT > MaxSP) then
		begin	
			MaxSP:= SobrePt;
			MaxCod:= Cod;
		end;
		writeln;
		writeln;
	end;
	writeln('c- El codigo de vuelo: ',MaxCod,' fue el de mayor sobrepeso');
	Close(Arch);
end.
