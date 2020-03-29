{Un mayorista vende huevos y los cobra de la siguiente forma:
$5 la primera docena,
del sobrante $3 cada 10 unidades,
de lo que sobra $2 cada 5 unidades
y luego $1 por unidad}
Program mayorista;
Var
	cantidad:byte;
	precio,sobrante:real;
Begin	
	sobrante:= 0;
	write('Ingrese la cantidad de huevos: ');readln(cantidad);
	
	Case cantidad of
		1..12: precio:= cantidad * 5;
		13..22: precio:= cantidad * 3;
		23..28: precio:= cantidad * 2;
	end;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	{If(cantidad <= 12) then
	begin
		precio:= cantidad * 5;
		
	end
	Else 
		if (cantidad <= 22) then
		begin
			sobrante:= (cantidad - 12) * 3;
			precio:= (cantidad * 5)  + sobrante; 
		end
		Else
			If (cantidad <= 27) then 
			begin
			sobrante:= (cantidad - 22) * 2;
			precio:= (cantidad * 4)  + sobrante;
				
			end
			Else
				precio:= cantidad;	}
				
				
	
			
				
	{If (sobrante <= 10) then
	begin	
		sobrante:= sobrante * 3;
		precio:= precio + sobrante;
	end	
	Else
		if (sobrante <= 5) then
		begin
			sobrante:= sobrante * 2;
			precio:= precio + sobrante;
		end
		Else
			sobrante:= sobrante;
			precio:= precio + sobrante;}
			
			
			
			
			
	//writeln('El sobrante es: ',sobrante:2:0);
	writeln('El precio a pagar es: $',precio:2:0);
end.
