//Se quiere calcular el precio que debe abonar para asegurar un automotor. Los parámetros que determinan el costo son:
//• Tipo de vehículo : C- Comercial ($200) ; P- Particular ($ 100)
//• Tipo de seguro : 1- Todo riesgo (+30%) ; 2- Básico (sin incremento)
//• Accidentes en el período anterior : S ; N ( – 5%)
//• Edad del conductor (más de 65 años + 10%)
Program calculaPrecio;
Var
	vehiculo,accidente,seguro:char;
	edad:byte;
	precio:real;
Begin
	write(' ingrese su tipo de vehiculo : C- Comercial / P- Particular: ');readln(vehiculo);
	write('ingrese el tipo de seguro : 1- Todo riesgo / 2- Basico: ');readln(seguro);
	write('Tuvo accidentes en el periodo anterior? S / N: ');readln(accidente);
	write('Cual es la edad del conductor? ');readln(edad);
	
		if(vehiculo = 'C') then
			precio:= 200
		Else 
			precio:=100;
			
		If(seguro = '1') then
			precio:= precio *1.3
		Else 
			precio:=precio;

		If(accidente = 'S') then
			precio:= precio
		Else 
			precio:= precio * 0.95;
		
		If(edad > 65 ) then
			precio:= precio*1.10
		Else
			precio:=precio;

	writeln(' debe abonar :',precio:4:2);readln(precio);
end.
		
	
