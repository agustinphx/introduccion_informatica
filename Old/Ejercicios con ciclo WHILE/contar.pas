Program contar;

Var
	numero,ContP,ContN,positivo,negativo:integer;
	
Begin
ContP:=0;
ContN:=0;
writeln('ingrese un numero');
readln(numero);
writeln('ingrese otro numero');
readln(numero);
				
				If (numero>0)  then
				begin 	
					writeln('es positivo');
					readln(positivo)
					end;	
					
					While numero <> negativo do
					begin
						 ContP:=ContP+1;
					     writeln('la cantidad de positivos son ',ContP);
					     readln(ContP);
					 end;
					 While numero <> positivo do
					 begin
							ContN:=ContN+1;
							writeln('la cantidad de negativos son ',ContN);
							readln(ContN);
					 end;
					
end.
