//Dada la siguiente tabla de temperaturas y deportes implementar un algoritmo que lee
//una temperatura y establezca el correspondiente deporte mostrando el nombre por pantalla
//TEMPERATURA < -5°  esquí
//-5° <= TEMPERATURA < 3°  ajedrez
//3° <= TEMPERATURA < 10°  golf
//10° <= TEMPERATURA < 18°  ciclismo
//18° <= TEMPERATURA < 28°  tenis
//28° <= TEMPERATURA  natación
Program temperaturas;
Var
	temperatura:integer;
Begin
	writeln('ingrese la temperatura :');readln(temperatura);

	If(temperatura < -5) then
		writeln('El deporte es : esqui');

	If(temperatura >= -5 ) and (temperatura < 3) then
		writeln('El deporte es : ajedrez');

	If(temperatura >= 3 ) and (temperatura < 10) then
		writeln('El deporte es : golf');
		
	If(temperatura >= 10) and (temperatura < 18) then
		writeln('El deporte es : ciclismo');

	If(temperatura >= 18) and (temperatura < 28) then
		writeln('El deporte es : tenis');
		
	If(temperatura >= 28) then
		writeln('El deporte es : natacion');
end.
