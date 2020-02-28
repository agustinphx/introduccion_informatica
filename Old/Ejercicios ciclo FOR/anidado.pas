// Testeando con archivo de texto y for

Program archivos;

Var
	arch:text;
	i:byte;
	letra:char;
	
Begin
assign(arch,'anidado.txt'); readln(arch);
reset(arch);
while not eof(arch) do
begin
For i:= 1 to 3 do
	begin
		write(i:4);
		for letra:= 'a' to 'f' do
			write(letra:3);
	end;
end;
end.


