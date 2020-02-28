// Hacer un algoritmo que muestre cuanto tiene el tanque de nafta y cuando debe llenar el tanque.

Program whileando;

Var
	nafta:integer;

Begin
write('ingrese la cantidad de nafta que figura en su tanque : ');readln(nafta);
	While ( nafta > 0) do
	begin	
		writeln('nafta restante :',nafta);
		nafta:= nafta -1;
	end;
	If( nafta = 0) then
	begin
		write('debe llenar el tanque')
	end;
		If (nafta < 0) then
		begin
			write(' no puede arrancar, no tiene nafta');
			nafta:= nafta + 1;
		end;
end.
