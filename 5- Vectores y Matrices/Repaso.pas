//Repaso de diversos tipos de procedimientos y funciones generales.
Program Repaso;
Type
	St12 = string[12];
	TM = array[1..100,1..100] of word;
	TVR = array[1..100] of real;
	TV = array[1..100] of st12;
	TVB = array[1..100] of word;
	
//////   LECTURAS DE ARCHIVO    //////

Procedure LeerArchivo(Var T:TM; Var V:TV; Var VB:TVB; Var N,M:byte); // Leer archivos sin N en una linea.
Var
	j:byte;
	arch:text;
begin
	N:= 0;
	assign(arch,'Repaso.txt');reset(arch);
	readln(arch,M);
	while not eof (arch) do
	begin
		N:= N + 1;
		read(arch,V[N]);
		read(arch,VB[N]);
		For j:= 1 to M do
			read(arch,T[N,j]);
		readln(arch);
	end;
	close(arch);
end; 

{
Procedure LeerArchivo(Var T:TM; Var V:TV; Var N,M:byte); // Leer archivos sin M en una linea.
Var
	i:byte;
	arch:text;
begin
	assign(arch,'Repaso.txt');reset(arch);
	readln(arch,N);
	For i:= 1 to N do
	begin
		M:= 0;
		read(arch,V[i]);
		while not eoln (arch) do
		begin
			M:= M + 1;
			read(arch,T[i,M]);
		end;
		readln(arch);
	end;
	close(arch);
end; }

Procedure Imprime(T:TM; V:TV; N,M:byte);
Var
	i,j:byte;
begin
	For i:= 1 to N do
	begin
		write(V[i]);
		For j:= 1 to M do
			write(T[i,j]:4);
		writeln;
	end;
end;

Procedure IniciaV(VCont:TVB; N:byte);
Var
	i:byte;
begin
	For i:= 1 to N do
		VCont[i]:= 0;
end;




//////   SUMAS    //////

Function SumaFila(T:TM; N,M:byte):word; //Suma los elementos de una fila.
Var
	j:byte;
	Sum:word;
begin
	Sum:= 0;
	For j:= 1 to M do
		Sum:= Sum + T[N,j];
	SumaFila:= Sum;
end;



Function SumaColumna(T:TM; M,N:byte):word; //Suma de los elementos de una columna.
Var
	i:byte;
	Sum:word;
begin
	Sum:= 0;
		For i:= 1 to N do
			Sum:= Sum + T[i,M];
	SumaColumna:= Sum;
end;




//////   PROMEDIOS    //////

Function Promedio(Mat:TM; N,M:byte):real; //Calcula el promedio entre la cantidad total que suma la matriz (656)  y la cantidad de espacios de la matriz (20) -> 656 /20 = 32.8.
Var
	i,j:byte;
	Acum:word;
begin
	Acum:= 0;
	For i:= 1 to N do
	begin
		For j:= 1 to M do
			Acum:= Acum + Mat[i,j];
	end;
	Promedio:= Acum / (N*M);
end;

Function PromedioFila(Mat:TM; Fila,M:byte):real; //Promedio de una fila.
Var
	j:byte;
	Sum:integer;
begin
	Sum:= 0;
	For j:= 1 to M do
		Sum:= Sum + Mat[N,j];
     PromedioDiario:= Sum / M;
end;



Function MaximoPromedioFila(T:TM; N,M:byte):real; //Maximo promedio de una fila.
Var
	i,j:byte;
	Sum:word;
	Prom,MaxProm:real;
begin
	MaxProm:= 0;
	For i:= 1 to N do
    begin
		Sum:= 0;
        For j:= 1 to M do
			Sum:= Sum + T[i,j];
        Prom:= Sum / M;
        
        If (Prom > MaxProm) then
			MaxProm:= Prom;
	end;
	MaximoPromedioFila:= MaxProm;
end; 



Function MaximoPromedioColumna(T:TM; N,M:byte):real; //Maximo promedio entre todas las Columnas junto con su posicion.
Var
	i,j:byte;
	Sum:word;
	Prom,MaxProm:real;
begin
	MaxProm:= 0;
	For j:= 1 to M do
    begin
		Sum:= 0;
        For i:= 1 to N do
			Sum:= Sum + T[i,j];
        Prom:= Sum / N;
        
        If (Prom > MaxProm) then
			MaxProm:= Prom;
    end;
    MaximoPromedioColumna:= MaxProm;
end;



function PromedioCodigo(Mat:TM; V:TV; N,M:byte; Cod:St3):real; //Segun un codigo ingresado por teclado, indica su promedio.
var
	i:byte;
begin
	i:= 1;
	while (i <= M) and (V[i] <> Cod) do
		i:= i + 1;  
		
	PromedioCodigo:= PromedioDiario(Mat,i,M);
end;



Function PosMaxPromFila(T:TM; N,M:byte):byte; //Posicion del maximo promedio entre todas las filas
Var
	i,Pos:byte;
	Prom,MaxProm:real;
begin
	MaxProm:= SumaFila(T,1,M) / M;
	Pos:= 1;
	For i:= 2 to N do
	begin
		Prom:= SumaFila(T,i,M) / M;
		If (Prom > MaxProm) then
		begin
			MaxProm:= Prom;
			Pos:= i;
		end;
	end;
	PosMaxPromFila:= Pos;
end;



Function PosMaxPromColumna(T:TM; N,M:byte):byte; //Posicion del maximo promedio entre todas las columnas
Var
	j,Pos:byte;
	Prom,MaxProm:real;
begin
	MaxProm:= SumaColumna(T,N,1) / N;
	Pos:= 0;
	For j:= 2 to M do
	begin
		Prom:= SumaColumna(T,N,j) / N;
		If (Prom > MaxProm) then
		begin
			MaxProm:= Prom;
			Pos:= j;
		end;
	end;
	PosMaxPromColumna:= Pos;
end;




//////   PORCENTAJES    //////

Function PorcentajeFilas(T:TM; N,M:byte):real; //Calculamos el % en base a las filas que tengan numeros distintos de 5.
Var
	i,j,Cont:byte;
begin
	Cont:= 0;
	For i:= 1 to N do
	begin
		j:= 1;
		while (j <= M) and (T[i,j] <> 0) do
			j:= j + 1;
			
		If (j > M) then
			Cont:= Cont + 1;
	end;
	PorcentajeFilas:= (Cont / N) * 100;
end;



Function PorcentajeColumnas(T:TM; N,M:byte):real; //Calculamos el % en base a las columnas que tengan numeros distintos de 0 .
Var
	i,j,Cont:byte;
begin
	Cont:= 0;
	For j:= 1 to M do
	begin
		i:= 1;
		while (i <= N) and (T[i,j] <> 0) do
			i:= i + 1;
			
		If (i > N) then
			Cont:= Cont + 1;
	end;
	PorcentajeColumnas:= (Cont / M) * 100;
end;



Function PorcentajeFilasSuperan(T:TM; N,M:byte):real;// Calcula el porcentaje de filas que en sus filas hay al menos un numero mayor a 50.
Var
	i,j,Cont:byte;
	Porc,MaxPorc:real;
begin
	MaxPorc:= 0;
	For i:= 1 to N do
	begin
		Cont:= 0;
		For j:= 1 to M do
		begin
			If (T[i,j] > 50) then
				Cont:= Cont + 1;
		end;
		Porc:= (Cont / N) * 100;
		
		If (Porc > MaxPorc) then
			MaxPorc:= Porc;
	end;
	PorcentajeFilasSuperan:= MaxPorc;
end;



Function PorcentajeColumnasSuperan(T:TM; N,M:byte):real; // Calcula el porcentaje de columnas que en sus columnas hay al menos un numero mayor a 50.
Var
	i,j,Cont:byte;
	Porc,MaxPorc:real;
begin
	Cont:= 0;
	MaxPorc:= 0;
	For j:= 1 to M do
	begin
		For i:= 1 to N do
		begin
			If (T[i,j] > 50) then
				Cont:= Cont + 1;
		end;
		Porc:= (Cont / M) * 100;
		
		If (Porc > MaxPorc) then
			MaxPorc:= Porc;
	end;
	PorcentajeColumnasSuperan:= MaxPorc;
end;



Procedure PorcentajeFilasSuperanPromedio(Kms:TM; Ciclistas:TV; N,M:byte); //Calcula el % de filas que tienen un promedio superior a 14.
Var
	i,j,Cont:byte;
	Prom,Porc:real;
begin
	Cont:= 0;
	For i:= 1 to N do
	begin
		Prom:= Promedio(Kms,i,M);
		For j:= 1 to M do
		begin
			If (Prom > 14) then
				Cont:= Cont + 1;
		end;
		Porc:= (Cont * 100) / (N*M);
	end;
	writeln(Porc:6:2);
end;

//////    GENERAR ARREGLOS    /////////

Procedure GenerarArregloPromedioFila(T:TM; N,M:byte; Var VPromFila:TVR); //Genera un arreglo PARALELO con los promedios de cada fila.
Var
	i,j:byte;
	Sum,Prom:real;
begin
	For i:= 1 to N do
    begin
		Sum:= 0;
		Prom:= 0;
        For j:= 1 to M do
			Sum:= Sum + T[i,j];
        Prom:= Sum / M;
        VPromFila[i]:= Prom;
	end;
end;



Procedure GenerarArregloPromedioColumna(T:TM; N,M:byte; Var VPromColumna:TVR); //Genera un arreglo  PARAPELO con los promedios de cada columna.
Var
	i,j:byte;
	Sum,Prom:real;
begin
	For j:= 1 to M do
    begin
		Sum:= 0;
		Prom:= 0;
        For i:= 1 to N do
			Sum:= Sum + T[i,j];
        Prom:= Sum / N;
        VPromColumna[j]:= Prom;
	end;
end;

Procedure ImprimeProm(VPromFila:TVR; N:byte);
Var
	i:byte;
begin
	For i:= 1 to N do
		write(VPromFila[i]:6:2,' ');
end;



Procedure GenerarArregloPromedioFilaSuperan(T:TM; V:TV; N,M,Z:byte; Var VPromFilaNoParalelo:TVR; Var V1:TV; Var H:byte); // Genera un arreglo NO PARALELO donde los promedios de cada fila superan el elemento Z(ingresado por teclado) .
Var
	i,j,Sum:byte;
	Prom:real;
begin
	H:= 0;
	For i:= 1 to N do
	begin
		Sum:= 0;
		Prom:= 0;
		For j:= 1 to M do
			Sum:= Sum + T[i,j];
		Prom:= Sum / M;
		
		If (Prom > Z) then
		begin
			H:= H + 1;
			V1[H]:= V[i];
			VPromFilaNoParalelo[H]:= Prom;
		end;	
	end;
end;

Procedure ImprimeArreglos(V1:TV; VPromFilaNoParalelo:TVR; H:byte);
Var
	i:byte;
begin
	write('Promedios de las filas que superan el limite ingresado: ');
	For i:= 1 to H do
		write(V1[i],VPromFilaNoParalelo[i]:6:2,'  ');
end; 



Procedure GenerarArregloPromedioColumnaSuperan(T:TM; N,M,W:byte; Var VPromFilaNoParalelo:TVR; Var L:byte); // Genera un arreglo NO PARALELO donde los promedios de cada columna superan el elemento W(ingresado por teclado) .
Var
	i,j,Sum:byte;
	Prom:real;
begin
	L:= 0;
	For j:= 1 to M do
	begin
		Sum:= 0;
		Prom:= 0;
		For i:= 1 to N do
			Sum:= Sum + T[i,j];
		Prom:= Sum / N;
		
		If (Prom > W) then
		begin
			L:= L + 1;
			VPromFilaNoParalelo[L]:= Prom;
		end;	
	end;
end;

Procedure ImprimePromedioColumnaSuperan(VPromFilaNoParalelo:TVR; L:byte);
Var
	i:byte;
begin
	write('Promedios de las columnas que superan el numero ingresado: ');
	For i:= 1 to L do
		write(VPromFilaNoParalelo[i]:6:2,'   ');
end; 



Procedure GenerarArregloPorcentajeFila(T:TM; V:TV; N,M:byte; Var VPorcFila:TVR; Var V3:TV; Var G:byte); //Porcentaje de filas que tienen promedio mayor a 32.
Var
	i,j,Sum:byte;
	Prom:real;
begin
	G:= 0;
	For j:= 1 to M do
	begin
		Sum:= SumaFila(T,N,M);
		Prom:= Sum / M;
		For i:= 1 to N do
			If (Prom > 32) then
			begin
				G:= G + 1;
				V3[G]:= V[i];
			end;	
	end;
end;


Procedure ImprimeVPorcFila(V3:TV; VPorcFila:TVR; G:byte);
Var
	i:byte;
begin
	For i:= 1 to G do
		writeln(V3[i],'   ',VPorcFila[i]:6:2);
end;




//////   PROCEDIMIENTOS PARA VERIFICAR    //////

Procedure VerificaFila(T:TM; V:TV; VB:TVB; N,M,P:byte); // Verifica cuantos elementos de cada fila de la matriz superan el numero que contiene el vector de la misma fila.
Var
	i,j,Cont:byte;
begin
	For i:= 1 to N do
	begin
		Cont:= 0;
		For j:= 1 to M do
			If (T[i,j] > VB[i]) then
				Cont:= Cont + 1;
	
		If (i <> N) then
			writeln('Fila ',i,' supero en ',Cont,' veces ')
		Else
			writeln('Fila ',i,' supero en ',Cont,' veces ');
	end;
end;

Procedure VerificaColumna(T:TM; V:TV; VB:TVB; N,M,P:byte); // Verifica cuantos elementos de cada columna de la matriz superan el numero que contiene el vector hablando de que este sea de la misma cantidad que las filas ejemplo: Jeronimo fila 3  38  columna 3 44 y 60 (2 veces supera el numero del vector).
Var
	i,j,Cont:byte;
begin
	For j:= 1 to M do
	begin
		Cont:= 0;
		For i:= 1 to N do
			If (T[i,j] > VB[i]) then
				Cont:= Cont + 1;
	
		If (j <> M) then
			writeln('Columna ',j,' supero en ',Cont,' veces ')
		Else
			writeln('Columna ',j,' supero en ',Cont,' veces ');
	end;
end;




//////  BUSCAR MAXIMO ELEMENTO Y SU POSICION   //////

Procedure MaximoElementoFilaConPosicionVector(T:TM; V:TV; N,M,Z:byte); //Encuentra el maximo elemento de una fila junto con su posicion en el vector en base a Z (fila ingresada por teclado) 																		//Encuentra el maximo elemento de una columna en base a X (columna ingresada por teclado).
Var
	i,j,Max,PosMax:byte;
begin
	Max:= 0;
	i:= 1;
	while (i <= N) and (i <> Z) do
		i:= i + 1 ;
		
	For j:= 1 to M do
		if (T[i,j] > Max) then
		begin
			Max:= T[i,j];
			PosMax:= i;
		end;
	
	If (Max > 0) then
		writeln(V[PosMax],'  con ',Max)
	Else
		writeln('No existe');
end;



Procedure MaximoElementoColumnaConPosicionVector(T:TM; V:TV; N,M,X:byte); //Encuentra el maximo elemento de una columna junto con su posicion en el vector en base a X (columna ingresada por teclado).
Var
	i,j,Max,PosMax:byte;
begin
	Max:= 0;
	j:= 1;
	while (j <= M) and (j <> X) do
		j:= j + 1 ;
		
	For i:= 1 to N do
		if (T[i,j] > Max) then
		begin
			Max:= T[i,j];
			PosMax:= i;
		end;
	
	If (Max > 0) then
		writeln(V[PosMax],'  con ',Max)
	Else
		writeln('No existe');
end; 



Procedure MaximoElementoFila(T:TM; V:TV; N,M,K:byte); //Encuentra el maximo elemento de una fila en base a K (fila ingresada por teclado).
Var
	i,j,Max,PosMax:byte;
begin
	Max:= 0;
	For j:= 1 to M do
	begin
		i:= 1;
		while (i <= N ) and (K <= N) do
			i:= i + 1;
			
			if (T[K,j] > Max) then
			begin
				Max:= T[K,j];
				PosMax:= K;
			end;
	end;
	
	If (Max > 0) then
		writeln(V[PosMax],'  con ',Max)
	Else
		writeln('No existe');
end;



Procedure MaximoElementoColumna(T:TM; V:TV; N,M,X:byte); //Encuentra el maximo elemento de una columna en base a X (columna ingresada por teclado).
Var
	i,j,Max,PosMax:byte;
begin
	Max:= 0;
	For i:= 1 to N do
	begin
		j:= 1;
		while (j <= M ) and (X <= M) do
			j:= j + 1;
			
		if (T[i,X] > Max) then
		begin
			Max:= T[i,X];
			PosMax:= i;
		end;
	end;
	
	If (Max > 0) then
		writeln(V[PosMax],'  con ',Max)
	Else
		writeln('No existe');
end;




/////   BUSQUEDA DE UN ELEMENTO EN ARREGLOS   ///////// 
{
Function Busca(V:TV; N,M,X:byte):byte; //Busca para ver si uno de los elementos del vector numero es el buscado y devuelve su posicion, si no lo encuentra da 0.
Var
	i:byte;
begin
	i:= 1;
	while (i <= N) and (X <> V[i]) do
		i:= i + 1;
	
	If (i <= N) then
		Busca:= i
	Else
		Busca:= 0;
end;


Function Busqueda(V:TV; N,M,X:byte):byte; //Busca hasta encontrar un elemento en el vector numerico en el que X  (numero ingresado por teclado) sea mayor a este, cuando se haga falso se ve si encontro o no el numero X  segun la posicion.
Var
	i,j:byte;
begin
	i:= 1;
	while (i < N) and (X > V[i]) do
		i:= i + 1;
	
	If (V[i] = X) then
		Busqueda:= i
	Else
		Busqueda:= 0;
end;

	}
	

	
	
//////  FUNCIONES PARA CANTIDAD DE ELEMENTOS  //////

Function CantidadFila(Mat:TM; N,M,X:byte):byte; //Cuenta la cantidad de elementos por fila que no superaron X elemento.
Var
	j,Cant:byte;
begin
	Cant:= 0;
	For j:= 1 to M do
		If (Mat[N,j] < X ) then
			Cant:= Cant + 1;
	CantidadFila:= Cant;
end;

Function CantidadColumna(Mat:TM; N,M,X:byte):byte; //Cuenta la cantidad de elementos por columna que no superaron X elemento.
Var
	i,Cant:byte;
begin
	Cant:= 0;
	For i:= 1 to N do
		If (Mat[i,M] < X ) then
			Cant:= Cant + 1;
	CantidadColumna:= Cant;
end;

Function CuantasFilas(T:TM; N,M:byte):byte; //Cuenta la cantidad de filas que tienen al menos 1 elemento = a 1.
Var
	i,j,Cont:byte;
begin
	Cont:= 0;
	For i:= 1 to N do
	begin
		j:= 1;
		while (j <= M) and (T[i,j] <> 1) do
			j:= j + 1;
		
		If (j > M) then
			Cont:= Cont + 1;
	end;
	CuantasFilas:= Cont;
end;


///// FUNCIONES PARA EL MAXIMO ELEMENTO  //////

Function MaximoFila(Mat:TM; N,M:byte):integer; //Encuentra el maximo elemento de una fila.
Var
	j:byte;
	Max:integer;
begin
	Max:= 0;
	For j:= 1 to M do
	begin
		If (Mat[N,j] > Max) then
			Max:= Mat[N,j];
	end;
	MaximoFila:= Max;
end;

Function MaximoColumna(Mat:TM; N,M:byte):integer; //Encuentra el maximo elemento de una columna.
Var
	i:byte;
	Max:integer;
begin
	Max:= 0;
	For i:= 1 to N do
	begin
		If (Mat[i,M] > Max) then
			Max:= Mat[i,M];
	end;
	MaximoColumna:= Max;
end;




//Hacer procedimientos y funciones de para un elemento X calcular y mostrar el maximo elemento de una fila, columna,
// algoritmos para calcular y generar un arreglo con el promedio de cada fila y cada columna, generar otro arreglo para cada fila y columna cuantos elementos cumplen una cierta condicion,
// para cada fila y columna el promedio de c/u y la diferencia con un numero 
// Generar un arreglo con los nombres que superaron el promedio de 30 en filas y columnas (no paralelo).
//Dada una  fila P, verificar si al menos una de las N filas supera el vector de numeros.
//Generar un arreglo con la cantidad de mezclas donde cada ingredientes aparece con una concentración mayor a Y (donde Y es un % ingresado por teclado) .
//Ver vectores contadores/acumuladores.
Var
	T:TM;
	V,V1,V2,V3,V4,V5,V6:TV;
	VB,VCont:TVB;
	VPromFila,VPromColumna,VPromFilaNoParalelo,VPromColumnaNoParalelo,VPorcFila,VPorcColumna:TVR;
	N,M,Y,K,X,Z,H,R,W,D,G,F,E,L,P,Cont:byte;
Begin
	LeerArchivo(T,V,VB,N,M);
	Imprime(T,V,N,M);
	writeln;
	writeln('Porcentaje de filas con numeros distintos de 0: ',PorcentajeFilas(T,N,M):6:2,' %');
	writeln;
	GenerarArregloPorcentajeFila(T,V,N,M,VPorcFila,V3,G);
	ImprimeVPorcFila(V3,VPorcFila,G);
	writeln;
end.
{
Procedure PromedioFila(T:TM; V:TV; N,M:byte); //Maximo promedio  entre todas las Filas junto con su posicion en el vector.
Var
	i,j,PosMax:byte;
	Sum:word;
	Prom,MaxProm:real;
begin
	MaxProm:= 0;
	For i:= 1 to N do
    begin
		Sum:= 0;
		Prom:=0;
        For j:= 1 to M do
			Sum:= Sum + T[i,j];
        Prom:= Sum / M;
        
        If (Prom > MaxProm) then
        begin
			MaxProm:= Prom;
			PosMax:= i;
		end;
    end;
	writeln(V[PosMax],' promedio maximo: ',MaxProm:6:2);
end; 


Procedure PromedioColumna(T:TM; N,M:byte); //Maximo promedio entre todas las Columnas junto con su posicion.
Var
	i,j,PosMax:byte;
	Sum:word;
	Prom,MaxProm:real;
begin
	MaxProm:= 0;
	For j:= 1 to M do
    begin
		Sum:= 0;
		Prom:=0;
        For i:= 1 to N do
			Sum:= Sum + T[i,j];
        Prom:= Sum / N;
        
        If (Prom > MaxProm) then
        begin
			MaxProm:= Prom;
			PosMax:= j;
		end;
    end;
	writeln('Columna ',PosMax,' promedio maximo: ',MaxProm:6:2);
end; 

Procedure MaximoImporteFila(T:TM; V:TV; N,M:byte; X:real); //Maxima cantidad de un importe X para  una fila.
Var
	i,j,PosMax:byte;
	Acum,Max:real;
begin
	Max:= 0;
	For i:= 1 to N do
	begin
		Acum:= 0;
		For j:= 1 to M do
		begin
			If (T[i,j] = 2) then
				Acum:= Acum + X 
			Else
				if (T[i,j] = 3) then
					Acum:= Acum + (X * 0.8);
		end;
		
		If (Acum > Max) then
		begin	
			Max:= Acum;
			PosMax:= i;
		end;	
	end;
	writeln(V[PosMax],' tiene el importe maximo con $',Max:6:2);
end;


Procedure MaximoImporteColumna(T:TM; N,M:byte; X:real); //Maxima cantidad de un importe X ingresado para una columna.
Var
	i,j,PosMax:byte;
	Acum,Max:real;
begin
	Max:= 0;
	For j:= 1 to M do
	begin
		Acum:= 0;
		For i:= 1 to N do
		begin
			If (T[i,j] = 2) then
				Acum:= Acum + X 
			Else
				if (T[i,j] = 3) then
					Acum:= Acum + (X * 0.8);
		end;
		
		If (Acum > Max) then
		begin	
			Max:= Acum;
			PosMax:= j;
		end;	
	end;
	writeln('Columna ',PosMax,' tiene el importe maximo con $',Max:6:2);
end;
* }
