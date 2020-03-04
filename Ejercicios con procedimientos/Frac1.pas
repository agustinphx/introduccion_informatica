Program fracciones;

Var
	X,Y,W,Z,Frac1,Frac2,Den1,Den2,Num1,Num2:real;
	Procedure DevolverSuma(A,B,C,D:real);
	
	Begin
		  Num1:=D*A;
		  Den1:=B*C;
		  Num2:=B*D;
		  Den2:=B*D;
		  
	writeln('el numerador es :' ,Num1,Num2:2:2);
	writeln('el denominador es :' ,Den1,Den2:2:2);
	end;
	
	Begin
		 writeln('ingrese el primer numerador');
		 readln(Den1);
		 writeln('ingrese el primer denominador');
		 readln(Num1);
		 
		 writeln('la primer fraccion es :' ,Num1:1,'/' ,Den1:1);
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 writeln('ingrese el segundo numerador');
		 readln(Num2);
		 writeln('ingrese el segundo denominador');
		 readln(Den2);
			
		 DevolverSuma(X,Y,W,Z);
		 readln();
	end.
