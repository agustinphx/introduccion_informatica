{Una planta de silos registra el ingreso de camiones de sus clientes con cereal, por cada uno se tiene:
• Cliente
• Patente del camión
• Tipo de cereal ( 1-trigo, 2-girasol, 3-soja, 4-maiz )
• Toneladas
Se pide que lea los datos desde un archivo y mediante un menú de opciones iterativo calcule e informe:
a) Porcentaje de toneladas de cada cereal respecto del total.
b) Dada una patente, si es que existe, decir qué tipo de cereal transporta, las toneladas y a qué cliente
pertenece.
c) Generar un arreglo con los clientes que transportaron más de X peso ordenado alfabéticamente }
Program Ad7;
Type
	St9 = string[9];
	St6 = string[6];
	TVC = array[1..100] of St9;
	TVP = array[1..100] of St6;
	TVCer = array[1..100] of byte;
	TVT = array[1..100] of real;
	TVConst = array[1..4] of string[9];
Const
  TipoCereal:TVConst = ('Trigo','Girasol','Soja','Maiz');
  
Procedure LeerArchivo(Var Cliente:TVC; Var Patente:TVP; Var Cereal:TVCer; Var Toneladas:TVT; Var N:byte);
Var
	arch:text;
begin
	N:= 0;
	assign(arch,'Ad7.txt');reset(arch);
	while not eof (arch) do
	begin
		N:= N + 1;
		read(arch,Cliente[N],Patente[N],Cereal[N]);
		readln(arch,Toneladas[N]);
	end;
	close(arch);
end;

Procedure IniciaSumaToneladas(Var SumaTonelada:TVT; N:byte);
Var
	i:byte;
begin
	For i:= 1 to N do
	begin
		SumaTonelada[i]:= 0;
	end;
end;

Procedure Porcentaje(Cereal:TVCer; Toneladas:TVT; N:byte;  Var SumaTonelada:TVT);
Var
	i,j,aux:byte;
	Porc,SumaTotal:real;
begin
	SumaTotal:= 0; 
	For i:= 1 to N do
	begin
		SumaTotal:= SumaTotal + Toneladas[i];
		aux:= Cereal[i];
		SumaTonelada[aux]:= SumaTonelada[aux] + Toneladas[i];
	end;
	For j:= 1 to 4 do //Recorremos en referencia a Trigo,Girasol,Soja y Maíz.
	begin
		Porc:= (SumaTonelada[j] / SumaTotal) * 100;
		writeln('Porcentaje de toneladas del tipo: ',TipoCereal[j],' es del ',Porc:2:0,' % sobre el total');
	end;
end;


Procedure Verifica(Patente:TVP; Cliente:TVC; Cereal:TVCer; Toneladas:TVT; N:byte);
Var
	i,aux,Cont:byte;
    BuscaPat:String[10];
begin
	Cont:= 0;
	write('Ingrese la patente que desea buscar: ');Readln(BuscaPat);
    For i:= 1 to N do
    begin
		If (BuscaPat = Patente[i]) then
        begin
          aux:= Cereal[i];
          writeln('La patente buscada transporta cereales de tipo ',TipoCereal[aux],', transporta ',Toneladas[i]:2:0,' toneladas y pertenece al cliente ',Cliente[i]);
        end;
        
        If (BuscaPat <> Patente[i]) then
			Cont:= Cont + 1;
    end;
      
    If (Cont = N) then
		writeln('No se encontro la patente en el sistema');
end;

Procedure GenerarArray(Cliente:TVC; Toneladas:TVT; N:byte; Var Ordenado:TVC; Var M:byte);
Var
	i:byte;
	X:real;
begin
	M:=0;
	write('Ingrese el monto minimo "X" de toneladas a buscar: ');readln(X);
    For i:=1 to N do
    begin
		if (Toneladas[i] > X) then
        begin
			M:= M + 1;
			Ordenado[M]:= Cliente[i];
        end;
    end;
end;

Procedure Ordena(Ordenado:TVC; M:byte);
Var
	i,j,K,N:byte;
	aux:String[10];
begin
	N:= M;
    Repeat
        K:= 0;
        For i:= 1 to N - 1 do
        begin
			If (Ordenado[i] > Ordenado[i + 1]) then
			begin
				aux:= Ordenado[i]; 
				Ordenado[i]:= Ordenado[i + 1]; 
				Ordenado[i + 1]:= aux;
				K:= i;
			end;
			N:=K;
		end;
    Until (K <= 1);
      
    writeln('Los clientes que superan el minimo de toneladas son:');
    For j:= 1 to M do
		writeln(Ordenado[j]);
end;
    
Procedure Menu(var Op:char);
  begin
	writeln;
    writeln('Menu de opciones:');
    writeln('1 - Saber el porcentaje de toneladas de cada cereal respecto del total');
    writeln('2 - Ingresar una patente y saber que tipo de cereal transporta, las toneladas y a que cliente pertenece');
    writeln('3 - Saber los clientes que transportan mas de una X cantidad de toneladas');
    writeln('4 - Finalizar');
    writeln;
    Repeat
       Write('Ingrese su opcion: ');readln(Op);
    Until (Op >= '1') and (Op <= '4');
  end;

Var
	Cliente,Ordenado:TVC;
	Patente:TVP;
	Cereal:TVCer;
	Toneladas,SumaTonelada:TVT;
	Op:char;
	N,M:byte;
Begin
	LeerArchivo(Cliente,Patente,Cereal,Toneladas,N);
	IniciaSumaToneladas(SumaTonelada,N);
	Repeat
		Menu(Op);
		Case Op of
			'1':Porcentaje(Cereal,Toneladas,N,SumaTonelada);
			'2':Verifica(Patente,Cliente,Cereal,Toneladas,N);
			'3':begin
					GenerarArray(Cliente,Toneladas,N,Ordenado,M);
					Ordena(Ordenado,M);
				end;
		  end;
    Until Op = '4';
end.
