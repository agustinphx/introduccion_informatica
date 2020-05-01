program parcial;

var
	archivo: text;
	medicos, i, obraSocial, contadorParticulares, cantidadDePacientes: byte;
	recargo, mayorMonto, montoPorMedico, promedio: real;
	car, turno: char;
	matricula, medicoQueMasCobro : string[5];
	
function importeConsulta(obraSocial:byte;turno:char;recargo:real):real;
var rec, valor: real;
begin
case obraSocial of
	1:valor := 0;
	2:valor := 350;
	3:valor := 200;
	4:valor := 800;
end;
if turno = 'N' then
begin
	rec := valor * recargo;
	if	rec > 50 then
		importeConsulta := valor + rec
	else
		importeConsulta := valor + 50;
end
else
	importeConsulta := valor;
end;

begin
assign(archivo, 'testing.txt');
reset(archivo);
readln(archivo,medicos);
readln(archivo,recargo);
recargo := recargo / 100;
contadorParticulares := 0;
mayorMonto := 0;
While not eof(Arch) do
begin
	montoPorMedico := 0;
	cantidadDePacientes := 0;
	read(archivo, matricula);
	writeln(matricula);
	read(archivo, obraSocial, car, turno);
	while (obraSocial <> 0) do
	begin
		writeln(obraSocial,car, turno);
		read(archivo, obraSocial, car, turno);
	end;
	writeln('----');
end;
close(archivo);
end.
{Program testing;

function importeConsulta(Mutual:byte;Turno:char;X:real):real;
Var
	Xrecargo,Precio: real;
begin
	case Mutual of
		1:Precio := 0;
		2:Precio := 350;
		3:Precio := 200;
		4:Precio := 800;
	end;
	
	If (Turno = 'N') then
	begin
		Xrecargo := Precio * 0.2;
		If (Xrecargo > 50) then
			importeConsulta := Precio + Xrecargo
		else
			importeConsulta := Precio + 50;
	end
	else
		importeConsulta := Precio;
	end;
	
	
	
Var
	i,N,Mutual:byte;
	Cant,ContP:word;
	Matricula,MaxMatricula:string[5];
	Espacio,Turno:char;
	X,Prom,MontoPorMedico,MaxCobro:real;
	arch:text;

Begin
	MaxCobro := 0;
	assign(arch,'testing.txt');reset(arch);
	readln(arch,N);
	readln(arch,X);
	for i:= 1 to N do
	begin
		montoPorMedico := 0;
		Cant := 0;
		ContP:= 0;
		readln(arch, Matricula);
		read(arch, Mutual, Espacio, Turno);
		while (Mutual <> 0) do
		begin
			read(arch, Mutual,Espacio,Turno);
			
			If (Mutual = 4) then
				ContP:= ContP + 1;
				
			MontoPorMedico:= MontoPorMedico + importeConsulta(Mutual,Turno,X);
		end;
		Prom:= MontoPorMedico / Cant;
		
		If (MontoPorMedico > MaxCobro) then //Calcula el monto y la matricula del medico que mas cobro.
		begin	
			MaxCobro:= MontoPorMedico;
			MaxMatricula:= Matricula;
		end;
		writeln(Matricula,' promedio de la consulta: ',Prom:2:0);
	end;
	close(Arch); 
	writeln('Importe de la consulta: ',MontoPorMedico:2:0);
	writeln('La cantidad de pacientes particulares son: ',ContP);
	writeln(MaxMatricula,' matricula del medico que mas cobro');
	writeln;
end.
	MaxCobro:= 0;
	MaxMatricula:= 0;
	ContP:= 0;
	Assign(arch,'testing.txt'); reset(arch);
	readln(arch,N);
	readln(arch,X);
	For i:= 1 to N do
	begin
		MontoPorMedico:= 0;
		 //Cuenta los pacientes particulares.
		Cant:= 0; //Cantidad de pacientes en general.
		read(arch,Matricula);
		writeln(Matricula);
		read(arch,Mutual,Espacio,Turno);
		while (mutual <> 0) do
		begin	
			If (i <> N) then //Recorremos toda una linea.
				read(arch,Mutual,Espacio,Turno)
			Else
				readln(arch,Mutual,Espacio,Turno); //Sino saltamos a la otra linea.			
			Cant:= Cant + 1;
			
			If (Mutual = 4) then
				ContP:= ContP + 1;
				
			MontoPorMedico:= MontoPorMedico + importeConsulta(Mutual,Turno,X);
		end;
		Prom:= MontoPorMedico / Cant;
		
		If (MontoPorMedico > MaxCobro) then //Calcula el monto y la matricula del medico que mas cobro.
		begin	
			MaxCobro:= MontoPorMedico;
			MaxMatricula:= Matricula;
		end;
		writeln(Matricula,' promedio de la consulta: ',Prom:2:0);
	end;
	close(Arch); 
	writeln('Importe de la consulta: ',MontoPorMedico:2:0);
	writeln('La cantidad de pacientes particulares son: ',ContP);
	writeln(MaxMatricula,' matricula del medico que mas cobro');}
	
	
	
	{While not eof (arch) do
	begin
		MontoPorMedico:= 0;
		ContP:= 0;
		Cant:= 0;
		read(arch,Matricula);
		For i := 1 to N do
		begin
			If (i <> N ) then
				read(arch,Mutual,Espacio,Turno)
			Else
				readln(arch,Mutual,Espacio,Turno);
			
			Cant:= Cant + 1;
			
			If (Mutual = 4) then
				ContP:= ContP + 1;
				
			MontoPorMedico:= MontoPorMedico + importeConsulta(Mutual,Turno,X);;	
		end;
		Prom:= MontoPorMedico / Cant;
		
		If (MontoPorMedico > MaxCobro) then
		begin
			MaxCobro:= MontoPorMedico;
			MaxMatricula:= Matricula;
		end;
		writeln(Matricula,' promedio de la consulta: ',Prom:2:0);
	end;
	close(arch);
	writeln('Monto abonar: ',MontoPorMedico:2:0);
	writeln('La cantidad de pacientes particulares son: ',ContP);
	writeln(MaxMatricula,' matricula del medico que mas cobro');
end.



Function ImporteConsulta(Matricula:word; Mutual:string; Monto:real):real;
var 
	PrecioMutual,Recargo,Porcentaje:real;
begin
	If(Mutual = '1') then
		writeln('sin cargo')
			
	Else If(Mutual= '2') then
		PrecioMutual:= 350	
		
	Else If(Mutual = '3') then
		PrecioMutual:= 200
		
	Else If(Mutual = '4') then
		PrecioMutual:= 800;
	
	If(Turno = 'N') then
	begin
		Recargo:=PrecioMutual + 50;
		Porcentaje:= PrecioMutual*(N/100);
		
	If(Recargo > Porcentaje) then
		PrecioMutual:=Recargo
	Else
		PrecioMutual:=Porcentaje;
	ImporteConsulta:= PrecioMutual;
	end;
end;
}


