{-Leer dos valores reales A y B (A < B), luego N números reales, calcular e informar el
promedio de los que pertenecen al intervalo [A, B]
Ejemplos: A= - 2.5 y B= 30.8
Los números son:
a) -1.3, 0, 50, -3.7, 5.5, 30.9  promedio = 1.4
b) -13, 80.3, 50, -3.7, 55, 30.9  no hay números en el intervalo 
Ahora los datos están en el archivo ‘Numeros.TXT’ donde en la primer
línea se encuentran los valores de A y B (con A < B), no se sabe cuántos números reales hay,
calcular e informar el promedio de los que pertenecen al intervalo [A, B] }
Program numeros;
Var
	Cont:word;
	A,B,prom,num,Suma:real;
	arch:text;
Begin
	Suma:= 0;
	Cont:= 0;
	Assign(arch,'numeros.txt');reset(arch);reset(arch);
	write('Ingrese el valor minimo del intervalo: ');readln(A);
	write('Ingrese el valor maximo del intervalo: ');readln(B);
	writeln(' ');
	While not Eof (arch) do
	begin
		readln(arch,num); //Primero leemos el archivo para poder verificar las siguientes condiciones:
		If (num >= A) and (num <= B) then
		begin
			Suma:= Suma + num;
			Cont:= Cont + 1;
		end
		Else
			writeln(num:2:2,'  No es un numero en el intervalo');
	end;
	prom:= Suma / Cont;
	writeln(' ');
	writeln('El promedio dentro del intervalo es: ',prom:2:2);	
	close(arch);
end.

