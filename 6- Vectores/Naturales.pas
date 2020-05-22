{Ingresar M números naturales y luego
a. Contar e informar cuántos elementos son pares, impares y nulos.
b. Multiplicar todos los componentes de posición par por un número ingresado por teclado,
validando que sea diferente de 0, mostrar por pantalla el conjunto de números resultante.
c. Mostrar por pantalla cuál es el lugar donde aparece el máximo (en caso de que este valor
aparezca más de una vez, considerar el primero).
Ejemplo:
números : 3 4 8 1 24 3 1 24 15 24  Máximo = 24 lugar= 5}
Program naturales;
Type
	TV = array[1..100] of byte;
Var
	Vec:TV;
	
Procedure LugarMaximo(Vec:TV; M:byte);
Var
	i,Max,MaxI:byte;
begin
	Max:= 0;
	MaxI:= 0;
	For i:= 1 to M do
	begin
		if (Vec[i] > Max) then
		begin
			Max:= Vec[i];
			MaxI:= i;
		end;
	end;
	writeln('El maximo numero es ',Max,' en el lugar: ',MaxI);
end;

Procedure Multiplica(Vec:TV; M:byte);
Var
	i:byte;
	Num:word;
begin
	For i:= 1 to M do
	begin
		if (i MOD 2 = 0) then
		begin
			write('Ingrese un numero para multiplicarlo con el de la posicion ',i,' : ');readln(Num);
			if (Num <> 0) then
			begin
				Num:= Vec[i] * Num;
				writeln(Num);
			end;
		end;
	end;
end;

Procedure Informa(Vec:TV; M:byte);
Var
	i,ContP,ContI,ContN:byte;
begin
	ContP:= 0;
	ContI:= 0;
	ContN:= 0;
	For i:= 1 to M do
	begin
		If (Vec[i] = 0) then //Debe ir primera esta condicion de nulo porque si lo ponemos al final puede contarlo mal.
			ContN:= ContN + 1
		Else
			if (Vec[i] MOD 2 = 0) then
				ContP:= ContP + 1
			Else
				ContI:= ContI + 1;	
	end;
	writeln('La cantidad de pares es: ',ContP);
	writeln('La cantidad de impares es: ',ContI);
	writeln('La cantidad de nulos es: ',ContN);		
end;

Procedure IngresaNumeros(Var Vec:TV);
Var
	i,M:byte;
begin
	write('Ingrese la cantidad de numeros: ');readln(M);
	For i:= 1 to M do
	begin
		write('Ingrese un numero: ');readln(Vec[i]);
	end;
	LugarMaximo(Vec,M);
	writeln;
	Informa(Vec,M);
	writeln;
	Multiplica(Vec,M);
end;

Begin
	IngresaNumeros(Vec);
end.
