//-Una empresa de transportes realiza envíos de cargas, se desea calcular y mostrar el importe a pagar.
//Los datos que se ingresan son PESO de la carga (número real) y CATEGORIA (dato
//codificado: 1 - común , 2 - especial , 3 – aéreo).
//El precio se calcula a $2 por Kg para categoría común, $2.5 por Kg para categoría
//especial y $3 por Kg para categoría aérea. Se cobra recargo por sobrepeso: 30% si
//sobrepasa los 15 Kg, 20% si pesa más de 10 Kg y hasta 15Kg inclusive, 10% más de 5Kg
//y hasta 10 Kg inclusive.
Program envios;
Var
	peso:longint;
	categoria:char;
	precio:real;
Begin
Write('Ingrese el peso del envio : ');readln(peso);
Writeln('Ingrese la categoria : 1- Comun / 2- Especial / 3- aereo ');readln(categoria);

If (categoria = '1') then
	precio:= peso * 2
Else if (categoria = '2') then
	precio:= peso * 2.5
Else if (categoria = '3') then
	precio:= peso * 3;

Write('El monto que debe abonar por su envio es : ',precio:2:0);
end.
