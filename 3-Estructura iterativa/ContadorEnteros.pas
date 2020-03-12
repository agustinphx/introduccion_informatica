Program Ej2b;
Var
N, i, ContP, ContN, SumP: word;
Num, SumN: integer;
Begin
ContP:=0;
ContN:=0;
SumP:=0; 
SumN:=0;
Write ('Ingresar cantidad de numeros:');
Readln(N);

For i:= 1 to N do
Begin
Writeln('Ingresar un numero:');
Readln(Num);
If Num > 0 then
Begin
	ContP:= ContP +1;
	SumP:= SumP + Num;
End
Else
Begin
	ContN:= ContN +1;
	SumN:= SumN + Num;
End
End;
If ContP <> 0 then
	Writeln('romedio positivos',SumP DIV ContP)
Else
	Writeln('noingresaron numeros positivos');
If ContN <> 0 then
	Writeln('Promedio negativos', SumN DIV ContN)
Else
	Writeln('no ingresaron numeros negativos');
readln();
End.
