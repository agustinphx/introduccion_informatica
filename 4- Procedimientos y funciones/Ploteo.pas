{Una agencia organiza promociones en el verano y las ofrece a distintas empresas.
De cada pedido que hace una Empresa se conoce:
- Código de Empresa ( XXX = fin de datos)
- Si desea Plotear el vehículo (S/N)
- Cantidad de días que dura la promoción

Además se sabe que el costo del pedido se calcula según la siguiente Tabla:
*Precio base $8000 (incluye vehículo con chofer )
* Ploteo del vehículo $5000
* Días ($300 por día) < a 7 días +15% 7 <= d <=15 igual precio Más de 15 días -10%

Se pide desarrollar un programa Pascal que ingrese la lista de pedidos a satisfacer y luego calcule e
informe:
a) Para cada Empresa el costo del pedido.
b) El máximo importe cotizado de las promociones que solicitaron ploteado del vehículo. Puede no
haber promociones con ploteo.}
Program Ploteo;

Function Costo(Plot:char; Dias:byte):real;
Var
	Pr:real;
begin
	Pr:= 8000 + (Dias * 300);
	
	If (Plot = 'S') then
		Pr:= Pr + 5000;
	
	Case Dias of
		1..6:Pr:= Pr * 1.15;
		7..15:Pr:= Pr;
		16..100:Pr:= Pr * 0.9;
	end;
	Costo:= Pr;
end;

Var
	Cod:string[4];
	Plot,Espacio:char;
	Dias:byte;
	Precio,Max:real;
	arch:text;
Begin
	Max:= 0;
	assign(arch,'Ploteo.txt');reset(arch);
	readln(arch,Cod,Espacio,Plot,Espacio,Dias);
	while (Cod <> 'XXX') do
	begin
		Precio:= Costo(Plot,Dias);
		
		If (Precio > Max) and (Plot = 'S') then
			Max:= Precio;
		
		writeln('El costo para la empresa con codigo: ',Cod,' es: $',Precio:2:0);
		writeln;
		readln(arch,Cod,Espacio,Plot,Espacio,Dias); //El readln debe ir al final para que calcule bien los demás valores.
	end;
	close(arch);
	writeln('El maximo importe cotizado con ploteo es: $',Max:2:0);
end.
