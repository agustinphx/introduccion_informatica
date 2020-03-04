Program Ej4a;
Var
ContP, ContN, SumP: word;
Num,SumN: integer;
Begin
Write ('Ingresar un numero:');
Readln(Num);
While Num <> 0 do
Begin
If Num MOD 2<> 0 then
Writeln(num);
Writeln('Ingresar un numero:');
Readln(Num);
End;

Begin
ContP:=0;
Write ('Ingresar un numero:');
Readln(Num);
While Num <> 0 do
Begin
If Num MOD 2<> 0 then
Writeln(num)
Else
ContP:= ContP +1;
Writeln('Ingresar un numero:');
Readln(Num);
End;
Writeln('La cantidad de pares es ', ContP);


Begin
Max:= -9999;
Write ('Ingresar un numero:');
Readln(Num);
While Num <> 0 do
Begin
If Num > Max then
Max := Num;
Write('Ingresar un numero:');
Readln(num);
Writeln('El maximo es', Max);
end;

Begin
ContP:=0; ContN:=0;
SumP:=0; SumN:=0;
Write ('Ingresar un numero:');
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
End
Write('Ingresar un numero:');
Readln(num);
End;
If ContP <> 0 then
Writeln('Promedio positivos');
SumP DIV ContP)
Else
Writeln('no ingresaron numeros positivos');
If ContN <> 0 then
Writeln(‘Promedio negativos’,
SumN DIV ContN)
Else
Writeln(‘no ingresaron numeros
negativos’);
End.
