{De N productos de “Precios Cuidados”, se tienen los nombres y los respectivos
precios.
Por otro lado hay datos del precio de venta de dichos productos en M comercios
Ejemplo N=5 y M=4
*Producto PrecioCuidado Comercios
Fideos    25           30 32 22 40
Azúcar    10           15 18 16 19
Café      75           74 97 80 81
Dulce     22           25 33 28 34
Arroz     18           20 17 16 23
Se pide, ingresar la información en estructuras de vector/es y matriz/ces, según
corresponda, calcular e informar:
a) Para cada producto indicar la diferencia entre el promedio de venta (en los M
comercios) y el establecido en precios cuidados
b) Para cada comercio, cuántos son los productos que respetan el precio cuidado (el
precio debe ser menor o igual al establecido en PreciosCuidados)
c) Dado un producto X, verificar si al menos uno de los M comercios lo respeta.
Respuestas:
a) Fideos 124/4=31
Azucar 68/4=17
café 332/4=83
dulce 120/4=30
Arroz 76/4=19
b) Comercio 1: 0 - 2: 1 - 3:2 - 4:0
c) X= Café  Si
   X= Azúcar  No }
Program TipoParcial3;
Type
	St6 = string[6];
	TM = array[1..100, 1..100] of word;
	TVPre = array[1..100] of real;
	TVProd = array[1..100] of St6;
	
Procedure LeerArchivo(Var Com:TM; Var Pre:TVPre; Var Prod:TVProd; Var N,M:byte);
Var
	i,j:byte;
	arch:text;
begin
	assign(arch,'TipoParcial3.txt');reset(arch);
	read(arch,N);
	readln(arch,M);
	For i:= 1 to N do
	begin
		read(arch,Prod[i]);
		read(arch,Pre[i]);
		For j:= 1 to M do
			read(arch,Com[i,j]);
		readln(arch);
	end;
	close(arch);
end;

Procedure Diferencia(Com:TM; Pre:TVPre; Prod:TVProd; N,M:byte); //Resuelve A.
Var
	i,j:byte;
	Acum:word;
begin
	For i:= 1 to N do
	begin
		Acum:= 0;
		For j:= 1 to M do
			Acum:= Acum + Com[i,j];
		writeln('A- Promedio de venta para ',Prod[i],' es: $',Acum/M:2:0);
		writeln('   La diferencia entre el precio cuidado y el promedio de venta es de: $',(Acum/M) - Pre[i]:2:0);
		writeln;
	end;
	
end;

Procedure Respeta(Com:TM; Pre:TVPre; Prod:TVProd; N,M:byte);
Var
	i,j,Cont:byte;
begin
	write('B - ');
	For j:= 1 to M do
	begin
		Cont:= 0;
		For i:= 1 to N do
			If (Com[i,j] <= Pre[i]) then
				Cont:= Cont + 1;
	
		If (j = M) then
			writeln('Comercio ',j,' :',Cont)
		Else
			write('Comercio ',j,' :',Cont,' - ');
	end;
end;

Procedure Verifica(Com:TM; Pre:TVPre; Prod:TVProd; N,M:byte);
Var
	Encuentra,j,X:byte;
begin
	Encuentra:= 0;
	write('Ingrese un numero del 1 al ',N,' : ');readln(X);
	For j:= 1 to M do
		If (Com[X,j] <= Pre[x]) then
			Encuentra:= 1;
			
	If (Encuentra = 1) then
		writeln('C- ',Prod[x],': Si se respeta el precio al menos una vez')
	Else
		writeln('C- ',Prod[x],': No se respeta el precio');
end;

Var
	Com:TM;
	Pre:TVPre;
	Prod:TVProd;
	N,M:byte;
Begin
	LeerArchivo(Com,Pre,Prod,N,M);
	Diferencia(Com,Pre,Prod,N,M);
	Respeta(Com,Pre,Prod,N,M);
	writeln;
	Verifica(Com,Pre,Prod,N,M);
end.
