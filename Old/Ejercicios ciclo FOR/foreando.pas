// Imprimir la tabla del 10
// Limitar la tabla

Program foreando;

Var
	i,tabla,limite:byte;
	resultado:real;
	
Begin
write('ingrese la tabla que desea  multiplicar :');  readln(tabla);
write('ingrese hasta que numero con el que desea obtener la tabla :'); readln(limite);

	For i:= 1 to tabla do 
		resultado:= tabla*i;
		writeln('el valor es : ',resultado:2:2);


end.
