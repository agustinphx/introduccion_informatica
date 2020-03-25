// testeando el for

Program forr;

Var
i,N:word;
numero,Contador:integer;

Begin
	i:= 0;
	N:=0;
	Contador:=0;
	writeln('ingrese la cantidad de numeros :'); readln(N);
	For i:= 1 to N do
		begin
			write('ingrese un numero :'); readln(numero);
			If( numero mod 2 <> 0) then
				Contador:= Contador + 1;
		end;
	writeln('los impares son :',Contador);
end.
