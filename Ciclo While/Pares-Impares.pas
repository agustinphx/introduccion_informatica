
Program Ej6b;
Var
Num: integer;
ContP,ContImpares: word;
PorcentajeP:real;
Begin
ContP:=0;
ContImpares:=0;
Write ('Ingresar un numero:');
Readln(Num);
While Num <> 0 do
	Begin
		If Num MOD 2<> 0 then
		ContImpares:= ContImpares + 1;
		Writeln('Ingresar un numero:');
		Readln(Num);
		
		If Num MOD 2 = 0 then
		ContP:= ContP + 1;
		writeln('ingrese un numero :');
		readln(Num);
	end;
	
PorcentajeP:=  ContP / num:4:2;
Writeln('La cantidad de pares es ', ContP);
writeln('la cantidad de impares son :',ContImpares);
writeln(' el porcentaje de pares es :',PorcentajeP);
End.
