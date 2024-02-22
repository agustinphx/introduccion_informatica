Program Pixeles;
Const
	Tope = 3;
Type
	TM = array[1..100,1..100] of byte;
	TV = array[1..10] of char;
	TVC = array[0..Tope] of word;

Procedure LeerArchivo(Var Mat:TM; Var V:TV; Var N,M:byte);
Var
	i,j:byte;
	arch:text;
begin
	assign(arch,'Pixeles.txt');reset(arch);
	readln(arch,N,M);
	For i:= 1 to N do
	begin
		read(arch,V[i]);
		For j:= 1 to M do
			read(arch,Mat[i,j]);
		readln(arch);
	end;
	close(arch);
end;

Function Promedio(Mat:TM; N,M:byte):real; //Calcula el promedio entre 39 (cantidad total de pixeles) y 24 (cantidad de espacios de la matriz) -> 39/24 = 1.63 .
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

Function MaximaFila(Mat:TM; V:TV; N,M:byte; Color:char):byte;
Var
	i,j,MaxFila:byte;
	Acum,Max:word;
begin
	Max:= 0;
	MaxFila:= 0;
	For i:= 1 to N do
	begin
		Acum:= 0;
		For j:= 1 to M do
			Acum:= Acum + Mat[i,j];
			
		If (V[i] = Color) then
			If (Acum > Max) then
			begin
				Max:= Acum;				
				MaxFila:= i;
			end;
	end;
	MaximaFila:= MaxFila;
end;

{Procedure MaximaFilaColor(Mat:TM; V:TV; N,M:byte; Color:char); //SIN MENU
Var
	MaxFila:byte;
begin
	MaxFila:= MaximaFila(Mat,V,N,M,Color);
	If (MaxFila > 0) then
		writeln('Color ',Color,' mayor intensidad en la fila ',MaxFila)
	Else
		writeln('No existe el color ingresado');
end; }

Procedure MaximaFilaColor(Mat:TM; V:TV; N,M:byte; Color:char); //CON MENU
Var
	MaxFila:byte;
begin
	write('Ingrese un color  R / A / V / N : ');readln(Color);
	MaxFila:= MaximaFila(Mat,V,N,M,Color);
	
	If (MaxFila > 0) then
		writeln('Color ',Color,' mayor intensidad en la fila ',MaxFila)
	Else
		writeln('No existe el color ingresado');
end;

Procedure Tonos(Mat:TM; N,M:byte; Var Cont:TVC); // Acumula y muestra la cantidad de elementos de cada Tono (0,1,2,3).
Var
	i,j:byte;
begin
	For i:= 1 to N do
	begin
		For j:= 1 to M do
			Cont[Mat[i,j]]:= Cont[Mat[i,j]] + 1;
	end;
	
	For i:= 0 to Tope do
		writeln('Tono ',i, '  Cantidad de pixeles: ',Cont[i]);
end;

Procedure Menu(Var Op:char);
begin
	writeln;
	writeln('Menu');
	writeln('1 - Promedio de pixeles');
	writeln('2 - Saber cual color tiene mas pixeles en una fila');
	writeln('3 - Cantidad de pixeles por tono (0,1,2,3)');
	writeln('4 - Salir');
	writeln;
	write('Ingrese una opcion: ');readln(Op);
end;

Var
	Mat:TM;
	V:TV;
	Cont:TVC;
	Color,Op:char;
	N,M:byte;

Begin
	LeerArchivo(Mat,V,N,M);
	{writeln;  //SIN MENU
	Tonos(Mat,N,M,Cont);
	writeln('Promedio:',Promedio(Mat,N,M):6:2);
	writeln;
	write('Ingrese un color  R / A / V / N : ');readln(Color);
	writeln;
	MaximaFilaColor(Mat,V,N,M,Color);
	writeln;
	Tonos(Mat,N,M,Cont); }
	
	Repeat // CON MENU
		Menu(Op);
		Case Op of
			'1':writeln('Promedio:',Promedio(Mat,N,M):6:2);
			'2':MaximaFilaColor(Mat,V,N,M,Color);
			'3':Tonos(Mat,N,M,Cont);
		end;
	Until (Op = '4');	
end.
