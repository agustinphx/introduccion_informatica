// Sabiendo que la masa corporal de una persona se calcula como peso / altura , evaluar si una
//persona es:
//- Delgada: si el coeficiente es menor a 18
//- Normal: si el coeficiente está entre 18 y 25 inclusive
//- Obesa: si el coeficiente es mayor a 25
Program cuerpo;
Var
	peso:byte;
	altura,masaCorporal:real;
Begin
write('ingrese el peso : ');readln(peso);
write('ingrese la altura : ');readln(altura);
altura:= altura * altura;
masaCorporal:= peso / altura;

If (masaCorporal < 18) then
	writeln('Es una persona delgada');

if(masaCorporal >= 18) and (masaCorporal <= 25) then
	writeln('Es una persona normal');

if(masaCorporal > 25) then
	writeln('Es una persona obesa');
end.

