{A patir de una cantidad N de numeros calcular:
Cuales son primos
El promedio de los numeros positivos}
Program testFunciones;

Function Promedio(Prom:real):real; //Promedio de los numeros positivos y negativos.
Var //Variables locales
	Num:integer;
	Cont,i,N:word;
Begin
	Cont:= 0;
	write('Cuantos numeros desea analizar? ');readln(N);
	For i:= 1 to N do
	begin
		write('Ingrese un numero: ');readln(Num);
		
		If (Num > 0) then
			Cont:= Cont + 1;
	end;
	Prom:= (Cont / N ) * 100;
	Promedio:= Prom;
end;



Function Primo(Num:integer):integer; //Determina si es un numero primo y los cuenta.
Var //Variables locales
	i,N,ContP,ContNP:word;
begin
	ContP:= 0;
	ContNP:= 0;
	writeln;
	write('Ingrese una nueva cantidad de numeros: ');readln(N);
	For i:= 1 to N do
	begin
		write('Ingrese otro numero: ');readln(Num);
		If (Num MOD i <> 0) then
			ContP:= ContP + 1;
	end;
	writeln('La cantidad de primos son: ',ContP);
end;



Var //Variables globales
	Num:integer;
	Prom:real;

Begin
	writeln(Promedio(Prom):2:2,' % es el promedio de positivos');
	Primo(Num);
end.
