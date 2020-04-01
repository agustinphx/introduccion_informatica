{-Leer dos valores reales A y B (A < B), luego N números reales, calcular e informar el
promedio de los que pertenecen al intervalo [A, B]
Ejemplos: A= - 2.5 y B=30.8
Los números son:
a) -1.3, 0, 50, -3.7, 5.5, 30.9  promedio = 1.4
b) -13, 80.3, 50, -3.7, 55, 30.9  no hay números en el intervalo 
Ahora los datos están en el archivo ‘Numeros.TXT’ donde en la primer
línea se encuentran los valores de A y B (con A < B), no se sabe cuántos números reales hay,
calcular e informar el promedio de los que pertenecen al intervalo [A, B] }
Program numeros;
Var
	Cont:word;
	prom,num,Suma:real;
	arch:text;
Begin
	Suma:= 0;
	Cont:= 0;
	Assign(arch,'numeros.txt');reset(arch);

	While not Eof (arch) do
	begin
		readln(arch,num); // Si lo hacia con read aunque estuviera todo en el archivo en la misma linea no me contaba el 0 para el promedio.
		If (num > -2.5) and (num < 30.8) then
		begin
			Suma:= Suma + num;
			Cont:= Cont + 1;
		end
		Else
			writeln(num:2:2,'  No es un numero en el intervalo');
	end;
	prom:= Suma / Cont;
	writeln(' ');
	writeln('El promedio dentro del intervalo es:',prom:8:2);	
	close(arch);
end.

