{Mensualmente, el Sector de Cobranzas de la empresa Pymes SA
asigna a sus N cobradores un conjunto de facturas, distribuidas de
acuerdo con la zona, para que realicen el cobro de éstas. Al finalizar
el mes, en un archivo Cobranzas.TXT se presenta la recaudación de
los cobradores:
 Nombre del cobrador
 Total a recaudar (Objetivo)
 Medio de pago (E:Efectivo, C:Cheque, F:Fin)
 Monto
Se pide desarrollar un programa pascal, eficaz, claro y eficiente que
ingrese los datos de rendición de cada cobrador para calcular e
informar:
a) El monto recaudado por cada Cobrador y su calificación (*).
b) Nombre del Cobrador que más recaudó en efectivo.
c) Maximo promedio que recaudo un cobrador.
(*) La empresa califica al cobrador según cuánto su recaudación
(Rec) se acerca al objetivo en porcentaje. Se lo considera:
‘M’=Muy Bueno si supera al 80% (100%>=Rec>80%,
‘B’=Bueno si está entre el 80% >=Rec>=50%
‘R’=Regular, Rec<50%
Desarrollar la función Califica con los parámetros que considere necesarios para calificar
al Cobrador.
Respuestas:
a) Gonzales: $ 1400 ‘R’
Bustos: $ 6550 ‘M’
Santos: $ 4100 ‘M’
Garay: $ 3800 ‘B’
b) El cobrador que más recaudó en efectivo fue: Bustos
c) $ 2050}

Program Cobradores;

Function Calificacion(SumaMonto,Objetivo: integer):char;
Var
	Calculo:real;
begin
	Calculo:= (SumaMonto *100) / Objetivo;
	if (Calculo > 80) then
		Calificacion:= 'M'
	else
		if (Calculo <= 80) and (Calculo >= 50) then
			Calificacion:= 'B'
		else
			Calificacion:= 'R';
end;

Var
	i,N,ContEfectivo,CobradorEfMaximo,Contmonto:byte;
	NombreCobrador,NombreCobradorEf,NombreCobradorEfMax:string[8];
	Objetivo,Monto,SumaMonto:integer;
	MedioDePago,CalificacionVendedor:char;
	MaxProm,Prom:real;
	arch:text;
Begin
	assign(arch,'Cobradores.txt');reset(arch);
	readln(arch,N);
	CobradorEfMaximo:=0;
	MaxProm:= 0;
	For i:= 1 to N do
	begin
		readln(arch,NombreCobrador,Objetivo);
		read(arch, medioDePago);
		SumaMonto:=0;
		ContEfectivo:=0;
		Contmonto:= 0;
		while (MedioDePago <> 'F') do
		begin
			Contmonto:= Contmonto + 1;
			readln(arch,Monto);
			SumaMonto:= SumaMonto + Monto;
			CalificacionVendedor:= Calificacion(SumaMonto,Objetivo);
			if (MedioDePago = 'E') then
			begin
				ContEfectivo:= ContEfectivo +1;
				NombreCobradorEf:= NombreCobrador;
			end;
			read(arch,MedioDePago);
		end;
		Prom:= SumaMonto / Contmonto;
		writeln('A- ',nombreCobrador,' recaudo en total $',SumaMonto,' con calificacion ',CalificacionVendedor);
		writeln;
			
		If (ContEfectivo > CobradorEfMaximo) then
		begin
			CobradorEfMaximo:= ContEfectivo;
			NombreCobradorEfMax:= NombreCobradorEf;
		end;
		
		If (Prom > MaxProm) then
			MaxProm:= Prom;
						
		readln(arch);
	end;
	writeln('B- El cobrador que mas recaudo en efectivo fue: ', nombreCobradorEfMax);
	writeln;
	writeln('C- El promedio maximo es: $',MaxProm:6:2); 
	close(arch);
End.
