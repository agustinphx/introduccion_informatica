{Desarrollar un programa Pascal, claro, eficiente, eficaz y modularizado que
implemente la siguiente consigna:
Leer en la primera línea de un archivo de texto N y M, a continuación una matriz A entera
de NxM y un B vector de N enteros. Cada línea tendrá una fila de la matriz y a
continuación un elemento del vector paralelo a la fila.
Ejemplo del archivo
4 3
16 3 4     4
11 4 10    3
2 14 8     7
8 6 16     2
Salida esperada:
	  (16+4)/2   14/1
VProm=  10        14
VFila=   1         3
A partir de la matriz A y del arreglo B generar dos arreglos paralelos VProm y VFila.
VProm es el promedio con los elementos de la fila que sean divisibles por la componente
del vector B en la misma posición. VFila es completado con el Nro de fila al cual
corresponde el calculo. No generar elementos en ambos arreglos cuando:
 no hay múltiplos en la fila
 el promedio obtenido ya esta en VProm (para otra fila)
Desarrollar la función Promedio, que recibe como parámetros la matriz A, el arreglo B y un
valor para la fila, y obtiene el promedio de dicha fila, cero si no hay elementos
Imprimir ambos arreglos.}
Program TipoParcial1;
Type
	TM = array[1..10, 1..10] of byte;
	TV = array[1..100] of integer;
	TVR = array[1..100] of real;
	
Procedure LeerArchivo(Var A:TM; Var B:TV; Var N,M:byte);
Var
	i,j:byte;
	arch:text;
begin
	assign(arch,'TipoParcial1.txt');reset(arch);
	readln(arch,N,M);
	For i:= 1 to N do
	begin
		For j:= 1 to M do
			read(arch,A[i,j]);
		readln(arch,B[i]);
	end;
	close(arch);
end;

Function Promedio(A:TM; B:TV;  Fila,M:byte):real;
Var
	j:byte;
	Sum,Cont:integer;
begin
	Sum:= 0;
	Cont:= 0;
	For j:= 1 to M do
	begin
		If (A[Fila,j] MOD B[Fila] = 0) then
		begin
			Sum:= Sum + A[Fila,j];
			Cont:= Cont + 1;
		end;
	end;
	
	If (Sum > 0) then 
		Promedio:= Sum / Cont
	Else
		Promedio:= 0;
end;

Function BusquedaMatriz(VProm:TVR; N:byte; Prom:real):byte;
Var 
	i:byte;
begin
	BusquedaMatriz:= 0;
	For i:= 1 to N do
	begin
		If (VProm[i] = Prom) then
			BusquedaMatriz:= 1;
	end;
end;

Procedure GenerarArrays(A:TM; B:TV; N,M:byte; Var VProm:TVR; Var VFila:TV; Var K:byte);
Var
	i:byte;
	Prom:real;
begin
	K:= 0;
	For i:= 1 to N do
	begin
	 	Prom:= Promedio(A,B,i,M);
		If (Prom <> 0) and (BusquedaMatriz(VProm,N,Prom) <> 1) then // Hay que invocar si o si la funcion BusquedaMatriz dentro del ciclo porque su valor va cambiando.
		begin
			K:= K + 1;
			VProm[K]:= Prom;
			VFila[K]:= i;
		end;
	end;
end;

Procedure ImprimeProm(VProm:TVR; K:byte);
Var
	i:byte;
begin
	For i:= 1 to K do
		write(VProm[i]:2:0,' ');
end;
//Uso dos procedimientos diferentes para imprimir los vectores debido a que son de distintos tipos (TV, TVR).
Procedure ImprimeFila(VFila:TV; K:byte);
Var
	i:byte;
begin
	For i:= 1 to K do
		write(VFila[i]:2);
end;

Var
	A:TM;
	B,VFila:TV;
	VProm:TVR;
	N,M,K:byte;
Begin
	LeerArchivo(A,B,N,M);
	GenerarArrays(A,B,N,M,VProm,VFila,K);
	write('VProm = ' );
	ImprimeProm(VProm,K); 
	writeln;
	writeln;
	write('VFila = ');
	ImprimeFila(VFila,K);
end. 
