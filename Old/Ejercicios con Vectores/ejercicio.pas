program Ejercicio;
(* Nombre del programa *)
uses crt;
(* Es una unit que permite utilizar la función readkey (presione para continuar) *)

procedure loops;
(* Comienzo del procedure *)
	var
	a, b, c: integer;
	(* Declaración de variables locales *)
begin
	a := 10;
	c:= 10;

	while a < 21 do
		begin
			writeln(a);
			readkey;
			a := a + 1;
		end;

	for b:= 10 to 20 do
		begin
			writeln(b);
			readkey;
		end;

	repeat
		writeln(c);
		readkey;
		c:= c + 1;
	until c = 21;

end;
(* Fin del procedure *)

begin
	loops;
end.



