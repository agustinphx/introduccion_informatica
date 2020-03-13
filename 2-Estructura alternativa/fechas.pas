//Ingresar dos fechas informar si la primera es menor o igual a la segunda.
Program fechas;
Var
	anio,fechaUno,fechaDos:longint;
	mes,dia:byte;
Begin
write('Ingrese el dia : ');readln(dia);
write('Ingrese el mes : ');readln(mes);
write('Ingrese el anio : ');readln(anio);
fechaUno:= anio + mes + dia;

writeln(' ');
writeln(' ');

write('Ingrese dia: ');readln(dia);
write('Ingrese el mes : ');readln(mes);
write('Ingrese el anio : ');readln(anio);
fechaDos:= anio + mes + dia;

writeln(' ');

If(fechaUno) < (fechaDos) then
	writeln('La primer fecha es menor a la segunda');
If(fechaUno) = (fechaDos) then
	writeln('La primera fecha es igual a  la segunda');
end.
