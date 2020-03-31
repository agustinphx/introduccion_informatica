{Un mayorista vende huevos y los cobra de la siguiente forma:
$5 la primera docena,
del sobrante $3 cada 10 unidades,
de lo que sobra $2 cada 5 unidades y luego $1 por unidad}
Program mayorista;
Var
	cantidad,sobrante:byte;
	precio:real;
Begin	

	write('Ingrese la cantidad de huevos: ');readln(cantidad);
			
	If(cantidad >= 12 ) then
		begin
			precio:= 5; // La primer docena vale $5
			sobrante:= cantidad - 12;
		end
		Else
			sobrante:= 12 - cantidad;

	If (sobrante >= 10) then //Primer forma para intentar resolverlo.
	begin
		precio:= precio + (sobrante DIV 10) * 3;
		sobrante:= sobrante MOD 10;
	end
	Else
		if (sobrante >= 5) then
		begin	
			precio:= precio + (sobrante DIV 5) * 2;
			sobrante:= sobrante MOD 5; 
		end
		Else
			precio:= precio + sobrante;		
	
	writeln('El precio es: $',precio:2:0);	
end.			
//Segunda forma(menos eficiente).			
	{If (sobrante >= 10) then // Los proximos paquetes de a 10 valen $3
	begin	
		precio:= precio + (sobrante DIV 10) * 3; // Tomo la parte entera de dividir sobrante por 10 y lo multiplico por 3 para tener  el precio a sumar.
		sobrante:= sobrante MOD 10; // 
	end
	Else
		if (cantidad >= 5) then // Los proximos paquetes de a 5 valen $2 
		begin
			precio:= precio + (sobrante DIV 5) * 2; // Divido el sobrante por 5 y lo multiplico por 2 para sumar,si corresponde,al precio.
			sobrante:= sobrante MOD 5; // Sobrante ahora es el resto de (MOD) de dividir por 5.
		end
		Else
			precio:= precio + sobrante; // La unidad vale $1.}
			
	{If (sobrante >= 10) then
	begin
		sobrante:= sobrante DIV 10;
		precio:= precio + (sobrante * 3);
	end
	Else
		if (sobrante >= 5) then
		begin	
			sobrante:= sobrante DIV 5;
			precio:= precio + (sobrante * 2);
		end
		Else
			precio:= precio + sobrante;}


	
			
