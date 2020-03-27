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
	write('ingrese la temperatura :');readln(temperatura);

	If (temperatura < -5) then
		writeln('El deporte es : esqui')
	Else
		If (temperatura < 3) then
		writeln('El deporte es : ajedrez')
	Else
		If (temperatura < 10) then
		writeln('El deporte es : golf')
	Else	
		If (temperatura < 18) then
		writeln('El deporte es : ciclismo')
	Else
		If (temperatura < 28)  then
		writeln('El deporte es: tenis')
	Else	
		
		writeln('El deporte es : natacion');
end.
