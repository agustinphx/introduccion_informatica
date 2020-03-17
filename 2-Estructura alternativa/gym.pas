//Un gimnasio cobra como arancel $50 por actividad, pero si la cifra supera los $200, se
//realiza un descuento del 10% cifra (así un cliente realiza 4 actividades paga $200 y uno
//que realiza 5 paga $225. Hacer un programa que solicite el nombre del cliente y la
//cantidad de actividades y saque por pantalla los dos datos ingresados y el valor a pagar (como en el ejemplo).
//Cliente XXXXXXXXXXXX
//Cantidad de actividades YY
//Monto $ RRR
Program gym;
Var
	cliente:string;
	arancel,descuento:real;
	actividad:longint;
Begin
write('ingrese el nombre del cliente : ');readln(cliente);
write('Ingrese la cantidad de actividades : ');readln(actividad);
arancel:= 50;
descuento:= arancel * 0.90;

If (actividad = 4) then
begin
	arancel:= descuento * actividad;
	write('El cliente : ',cliente, ', debe abonar : ',arancel:2:0);
end
Else if(actividad = 5) then
begin
	arancel:= descuento * actividad;
	write('El cliente : ',cliente, ', debe abonar : ',arancel:2:0);
end;
end.
