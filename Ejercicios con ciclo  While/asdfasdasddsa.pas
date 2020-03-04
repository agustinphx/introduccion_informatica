Program empresa;
Var
	//CantV(Cantidad Ventas) CantVDTO (Cantidad ventas con descuento)
	CantV,CantVDto:word;
	montos,Dto:real;
	
Begin
CantV:=0;
CantVDto:=0;
writeln('ingrese el monto');readln(montos);
    If (montos > 4500) then 
				CantVDto:=CantVDto +1;
				writeln('la cant de montos con desc fueron :' ,CantVDTO);readln();
	while(montos > 0 ) do
	
end.
