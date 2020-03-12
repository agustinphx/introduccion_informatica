// Se ingresan numeros y se saca el promedio de los positivos y negativos ingresados. Con el 0 se termina el programa.
Program Ej4d;
Var
ContP, ContN, SumP: word;
Num,SumN: integer;
Begin
ContP:=0; ContN:=0;
SumP:=0; SumN:=0;
Write ('Ingresar un numero :');
Readln(Num);
While Num <> 0 do
Begin
If Num > 0 then
Begin
	ContP:= ContP +1;
	SumP:= SumP + Num;
End
Else
Begin
	ContN:= ContN +1;
	SumN:= SumN + Num;
End;
Write('Ingresar un numero :');
Readln(num);
End;
If ContP <> 0 then
	Writeln('Promedio positivos :',SumP DIV ContP)
Else
	Writeln('no ingresaron numeros positivos :');
If ContN <> 0 then
	Writeln('Promedio negativos : ',SumN DIV ContN);
End.
