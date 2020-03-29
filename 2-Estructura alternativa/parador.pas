//13.-En el parador Honolulu se dan cursos de windsurf, el importe a abonar por los mismos se calcula de la siguiente forma :
//El costo por cada clase es:
// $30 hasta 5 clases
// $25 hasta 12 clases
// $18 mas de 12 clases
//Si no dispone de equipo propio debe agregar $5 por cada clase
//Los clientes del parador con tarjeta VIP tienen un descuento del 15% sobre el total.
//Determine:
// los datos que debe ingresar,
// presente 2 juegos de datos y su resultado
Program parador;
Var
	clases:byte;
	monto:real;
	equipo,vip:char;
Begin
	write('ingrese la cantidad de clases : ');readln(clases);
	write('Tiene equipo propio? S / N : ');readln(equipo);
	write('Es cliente VIP? S / N : ');readln(vip);

	If(clases <= 5) then
		monto:= clases * 30
	Else	
		If(clases <= 12) then
			monto:= clases * 25
		Else
			monto:= clases * 18;
			
	If(equipo = 'N') then
		monto:= monto + 5;

	If(vip = 'S') then
		monto:= monto * 0.85;
		
	writeln('el monto a abonar por las clases es : $',monto:2:0);
end.
