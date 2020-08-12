{La administración del edificio Italia está organizando las facturas de los impuestos que deben pagar todos los departamentos del edificio, para lo cual cuenta con un archivo (Impuestos.txt) que contiene la siguiente información:
 Piso (1 - Primero, 2 - Segundo, 3 - Tercero, 4 - Cuarto, 5 - Quinto).
 Monto a pagar por cada departamento del Piso.
Se pide leer la información del archivo y mediante un menú que permita la repetición de las opciones con diferentes valores, calcular:
1. Monto total a pagar por cada piso
2. Promedio del valor a pagar por cada piso
3. Porcentaje que representa el monto a pagar de cada piso, respecto al monto total
4. Piso que tiene X número de facturas por pagar (Mostrar el primero que se encuentre, puede no existir)
5. Información disponible de X piso }

Program Edificio;

Type
  TipoVec1 = array[1..5]of integer;
  TipoVec2 = array[1..5]of string[10];

Const
  Pisos:TipoVec2=('Primero','Segundo','Tercero','Cuarto','Quinto');

Var
  TotalMonto,TotalFact:TipoVec1;
  Op:char;
  XF,ind,XP:byte;

Procedure IniciaVec(Var Vec:TipoVec1);
Var
  i:byte;
Begin
	For i:= 1 to 5 do
		Vec[i]:= 0;
End;

Procedure Totales(Var TotalMonto,TotalFact:TipoVec1);
Var
  Arch:Text;
  Piso:byte;
  Monto:integer;
Begin
	assign(Arch,'Pisos.txt');reset(Arch);
	while not eof (Arch) do
	begin
		readln(Arch,Piso,Monto);
		TotalFact[Piso]:= TotalFact[Piso] + 1;
		TotalMonto[Piso]:= TotalMonto[Piso] + Monto;
	end;
	close(Arch);
End;

Procedure EscribeVec(Vec:TipoVec1);
Var
  i:byte;
Begin
 For i:=1 to 5 do
     Writeln(Pisos[i],Vec[i]:10);
End;

Procedure Promedio(TotalMonto,TotalFact:TipoVec1);
Var
  i:byte;
  Prom:real;
Begin
 For i:=1 to 5 do
     begin
		 Prom:=TotalMonto[i]/TotalFact[i];
		 writeln(Pisos[i],Prom:10:2);
     end;
End;

Function MontoTotal(TotalMonto:TipoVec1):integer;
Var
  i:byte;
  Total:integer;
Begin
 Total:= 0;
 For i:= 1 to 5 do
     Total:=Total+TotalMonto[i];
 MontoTotal:=Total;
End;

Procedure Porcentaje(TotalMonto:TipoVec1);
Var
  i:byte;
  Porc:real;
  TotalImp:integer;
Begin
 TotalImp:=MontoTotal(TotalMonto);
 For i:= 1 to 5 do
     begin
		 Porc:=(TotalMonto[i]*100)/TotalImp;
		 writeln(Pisos[i],Porc:10:2);
     end;
End;

Function BuscaPiso(TotalFact:TipoVec1;XF:byte):byte;
Var
 i:byte;
Begin
 i:= 1;
 While (i <= 5) and (XF <> TotalFact[i]) do
       i:= i + 1;
 if (i <= 5) then
         BuscaPiso:= i
 else
         BuscaPiso:= 0;
End;

Procedure Menu(Var Op:char);
Begin
	writeln;
	writeln('MENU DE OPCIONES');
	writeln('1- Monto total a pagar por cada piso');
	writeln('2- Promedio del valor a pagar por cada piso');
	writeln('3- Porcentaje que representa el monto a pagar de cada piso, respecto al monto total');
	writeln('4- Piso que tiene X numero de facturas por pagar');
	writeln('5- Informacion disponible de X piso');
	writeln('6- Fin');
	Repeat
		write('Ingrese su opcion:  ');readln(Op);
	Until (Op>='1') and (Op<='6');
	writeln;
End;

begin    
	IniciaVec(TotalFact);
	IniciaVec(TotalMonto);
	Totales(TotalMonto,TotalFact);
	Repeat
		Menu(Op);
		Case Op of
			'1':Begin
					writeln('El monto total a pagar por cada piso es: ');
					EscribeVec(TotalMonto);
				end;
			 '2':Begin
					 writeln('El promedio a pagar por cada piso es: ');
					 Promedio(TotalMonto,TotalFact);
				 end;
			 '3':Begin
					 writeln('El porcentaje que representa cada piso es: ');
					 Porcentaje(TotalMonto);
				 end;
			 '4':Begin
					 writeln('Ingrese el numero de facturas a buscar');readln(XF);
					 ind:=BuscaPiso(TotalFact,XF);
					 
					 if ind <>0 then
							 writeln('El ',Pisos[ind], ' tiene ', XF,' facturas')
					 else
							 writeln('Ningun piso tiene esa cantidad de facturas');
				 end;
			 '5':Begin
					 Repeat
						write('Ingrese el piso:  ');readln(XP);
					 until (XP >= 1) and (XP <= 5);
					 writeln('El piso ',XP, ' tiene ',TotalFact[XP],' facturas por pagar');
					 writeln('El piso ',XP, ' tiene ',TotalMonto[XP],' por pagar');
				end;
		end;
	until Op = '6';
end.
