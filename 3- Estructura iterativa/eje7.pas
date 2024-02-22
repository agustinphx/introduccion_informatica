{-Leer dos valores reales A y B (A < B), luego un conjunto de números reales, calcular e
informar el promedio de los que pertenecen al intervalo [A, B]
Ejemplos: A= - 2.5 y B=30.8
Los números son:
a) -1.3, 0, 50, -3.7, 5.5, 30.9  promedio = 1.4
b) -13, 80.3, 50, -3.7, 55, 30.9  no son números en el intervalo}
Program eje7;
Var
	i,N,Cont:word;
	A,B,prom,num,Suma:real;
Begin
	Suma:= 0;
	Cont:= 0;
	write('Ingrese el minimo intervalo: ');readln(A);
	write('Ingrese el maximo intervalo: ');readln(B);
	writeln(' ');
	write('Ingrese la cantidad de numeros: ');readln(N);
	For i:= 1 to N do
	begin
		write('Ingrese un numero: ');readln(num);
		If (num > A) and (num < B) then
		begin
			Suma:= Suma + num;
			Cont:= Cont + 1;
		end
		Else
		begin
			writeln('No es un numero dentro del intervalo');
			writeln(' ');
		end;
	end;
	prom:= Suma / Cont;
	writeln('El promedio dentro del intervalo es: ',prom:2:2);	
end.
