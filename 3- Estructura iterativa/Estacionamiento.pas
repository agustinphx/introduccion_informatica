// Se ingresa un dia del mes y la cantidad de horas para ver el monto a pagar de estacionamiento
Program estacionamiento;
uses crt;
Var
	dia,horas:byte;
	monto,dto:real;
	CantAP,CantAN:word; //Cantidad de Autos que Pagaron,Cantidad de Autos que No 
Begin
	Repeat
			clrscr;
			CantAP:=0;
			CantAN:=0;
			writeln('ingrese el dia');
			readln(dia);
			If(dia>=1) and (dia<=5) then
			begin
				writeln('tiene dia el dia gratis');
				CantAN:=CantAN+1;
			end;
			writeln('ingrese la cantidad de horas');
			readln(horas);
			monto:=(dia*horas)*1.5;
			dto:=(dia*horas)*1.5-8;
	Until(dia>5);

	writeln('El monto a pagar por este auto es ',monto:4:2);readln(monto);
end.
	 
			 
			
