{Leer de un archivo de texto sobre tres arreglos los datos de un conjunto de autos, por cada uno:
- Patente
- Año
- Precio
Se pide mediante un menú que permita la repetición de las opciones con diferentes valores,
calcular:
a. Para un año dado, precio mínimo (puede no existir)
b. Para un precio dado cantidad de vehículos por debajo de dicho valor
c. Para un rango de años dado [Año1, Año2] precio promedio de los autos en dicho rango (puede
no existir)}
Program Vehiculos;
Type
	St6 = string[6];
	TVA = array[1..100] of word;
	TVPat = array[1..100] of st6;
	TVPre = array[1..100] of real;

Procedure LeerArchivo(Var VA:TVA; Var VPat:TVPat; Var VPre:TVPre; Var N:byte);
Var
	Esp:char;
	arch:text;
begin
	N:= 0;
	assign(arch,'Vehiculos.txt');reset(arch);
	while not eof (arch) do
	begin
		N:= N + 1;
		readln(arch,VPat[N],Esp,VA[N],Esp,VPre[N]);
	end;
	close(arch);
end;

Procedure PrecioMinimo(VA:TVA; VPre:TVPre; N:Byte);
Var 
	i:byte;
	anio:word; 
	Min:real; 
Begin 
	Min:= 999999;
    write('Ingrese el anio del cual quiere saber el precio minimo: '); readln(anio);
    For i:= 1 to N do
    begin
		If (anio = VA[i]) then
		begin
            if (VPre[i] < Min) then
                Min:= VPre[i];
        end;
	end;
	If (Min = 999999) then
		writeln('No hay vehiculos de ese anio')
	Else
		writeln('El auto mas barato sale: $',Min:2:0);
end;

Procedure BajoValor(VA:TVA; VPre:TVPre; N:Byte);
Var 
	i,Cant:byte; 
	Pr:real;
Begin 
	Cant:=0;
    write('Ingrese el precio de referencia: '); readln(Pr);
    For i:= 1 to N do
    begin
        if (Pr > VPre[i]) then
			Cant:= Cant + 1;
	end;
	
    If (Cant > 0) then
      writeln('La cantidad de vehiculos por debajo de ese valor es: ',Cant)
    Else
      writeln('No hay vehiculos por debajo de ese valor');  
end;
  
Procedure PromedioRango(VA:TVA; VPre:TVPre; N:byte);
Var 
	i,Cant:byte; 
	AnioInf,AnioSup:word; 
	Pr,Prom:real;
Begin
	Pr:= 0; 
	Cant:= 0;
    write('Ingrese el anio inferior: '); readln(AnioInf);
    write('Ingrese el anio superior: '); readln(AnioSup);
    For i:= 1 to N do
    begin
        If (AnioInf <= VA[i]) and (AnioSup >= VA[i]) then
		begin
			Cant:= Cant + 1;
			Pr:= Pr + VPre[i];
		end;
    end;
    
	If (Pr > 0) then
    begin
		Prom:= Pr / Cant;
        writeln('El precio promedio entre esos anios es de: $',Prom:2:0)
    end
	else
		writeln('No existen autos en esos anios');   
end;

Procedure Menu (Var Op:char);
begin
	writeln;
	writeln('1: Calcular el precio minimo de un vehiculo de X anio');
	writeln('2: Calcular la cantidad de autos por debajo de un X precio');
	writeln('3: Calcular el precio promedio de un rango de anios');
	writeln('4: - Fin');
	writeln;
	write('Ingrese una opcion: ');readln(Op);
end;

Var
	VA:TVA;
	VPat:TVPat;
	VPre:TVPre;
	Op:char;
	N:byte;
Begin
	LeerArchivo(VA,VPat,VPre,N);
	Repeat
		Menu(Op);
		Case Op of
			'1': PrecioMinimo(VA,VPre,N);
			'2':  BajoValor(VA,VPre,N);
			'3': PromedioRango(VA,VPre,N);
		end;
	Until Op = '4';
end.
