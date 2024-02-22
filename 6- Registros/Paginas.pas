{Se tiene información de N páginas web, por cada una
•	Nombre
•	Cantidad promedio de clicks (por visita)
•	Tiempo promedio de navegación (por visita)

a.- Declarar un tipo arreglo que mediante componentes de tipo registro almacene la información de un conjunto de páginas

b.- Desarrollar un procedimiento que a partir de una variable del tipo declarado en a. devuelva los nombres de las páginas con mayor tiempo promedio de navegación y menor cantidad promedio de cliclks
}
Type // Declarando el punto a.
	St20 = string[20];
	Treg = record
		Nombre:st20;
		PClick:word;     
		PTiempo:real;
end;
TV = array[1..20] of Treg;

Procedure Calcula(V: TV; N:Byte); // Resuelve b.
Var
	i:byte;
	MaxT:real; 
	MinC:integer;
	MaxNTiempo,MinNClick:st20; 
begin 
	MaxT:= 0;
	MinC:= 9999; 
	For i:= 1 to N do 
		begin
            If (V[i].PTiempo > MaxT) then
			begin            			 
				MaxT:= V[i].PTiempo;       
				MaxNTiempo:= V[i].nombre;
			end;
			
			if (V[i].PClick < MinC) then
			begin		 
				MinC:=V[i].PClick;  
				MinNClick:=V[i].nombre;
			end;
		end; 
	writeln('Pagina con maximo tiempo ',MaxNTiempo);
	writeln('Pagina con menos clicks ',MinNClick);
end;

Var
	V:TV;
	N:byte;
Begin
	Calcula(V,N);
End.
