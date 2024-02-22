{Leer de un archivo de texto los coeficientes de un conjunto de polinomios con raíces
reales, calcular y mostrar las raíces de cada uno}
Program Polinomios;
Var
	a,b,c,x1,x2:real;
	
Procedure MuestraRaices(a,b,c:real; var x1,x2:real); 
Var
	d:real;
begin
	d:= (b * b) - (4*a*c);
	If (d > 0) then
	begin
		 x1:=(-b +sqrt(d)) / (2*a);
		 x2:=(-b -sqrt(d)) / (2*a);
		 writeln('El polinomio con los coeficientes: ','a',a:2:0,'  ','b ',b:2:0,'  ','c ',c:2:0,' posee las raices  x1= ',x1:2:0, '  y  x2= ',x2:2:0);
	end
	else
		if (d = 0) then 
			writeln('El polinomio con los coeficientes: ','a',a:2:0,'  ','b ',b:2:0,'  ','c ',c:2:0,' posee una unica raiz x= ',-b/(2*a):2:0)
		else
			writeln('El polinomio no tiene solucion');
	writeln;	
end;

Procedure LeerArchivo;
Var
	i,N:byte;
	arch:text;
begin
	assign(arch,'Polinomios.txt');reset(arch);
	readln(arch,N);
	For i:= 1 to N do
	begin
		read(arch,a,b,c);	
		MuestraRaices(a,b,c,x1,x2);
	end;
	close(arch);
end;

Begin
	LeerArchivo;
end.

	{assign(arch,'Polinomios.txt');reset(arch);
	readln(arch,N);
	For i:= 1 to N do
	begin
		read(arch,a,b,c);
		d:= (b * b) - (4*a*c);
		If (d > 0) then
		begin
			 x1:=(-b +sqrt(d)) / (2*a);
			 x2:=(-b -sqrt(d)) / (2*a);
			 writeln('El polinomio con los coeficientes: ','a',a:2:0,'  ','b ',b:2:0,'  ','c ',c:2:0,' posee las raices  x1= ',x1:2:0, '  y  x2= ',x2:2:0);
		end
		else
			if (d = 0) then 
				writeln('El polinomio con los coeficientes: ','a',a:2:0,'  ','b ',b:2:0,'  ','c ',c:2:0,' posee una unica raiz x= ',-b/(2*a):2:0)
		Else
			writeln('El polinomio no tiene solucion');
		writeln;
	end;}
