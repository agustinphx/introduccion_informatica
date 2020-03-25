{Leer un conjunto de números enteros cuya cantidad no se conoce de antemano (se
sabe que son distintos de cero),
a - mostrar los impares
b - mostrar los impares y además contar e informar cuantos son pares.
c - calcular el máximo (iniciando el máximo con un valor imposible o con el 1er valor leído)
d - calcular el promedio de positivos y negativos
e - calcular el promedio de positivos, negativos y contar los ceros}
Program Lee;
Var
	num,Max:integer;
	ContP:word;
Begin
	ContP:= 0;
	Max:= -9999;
	Write ('Ingresar un numero: ');readln(Num);
	While Num <> 0 do
	Begin
		If Num MOD 2<> 0 then
		begin
			Writeln(num);
			ContP:= ContP + 1;
			Writeln('Ingresar un numero: ');readln(Num);
		end;
		If Num > Max then
			Max := Num;
	end;
	Writeln('La cantidad de pares es ', ContP);
	Writeln('El maximo es ', Max);
End.
