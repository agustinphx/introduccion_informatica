Program estacionamiento;
	 
	  Var
		 dia,horas:byte;
		 monto,dto:real;
		 CantAutosP,CantAutosN:word;
	  
	  Begin		
			CantAutosP:=0;
			CantAutosN:=0;
			writeln('ingrese el dia que estaciono');
			readln(dia);
			writeln('ingrese la cantidad de horas');
			readln(horas);
			
			
				If(dia>=1) and (dia<=5) then
				begin
					writeln('este auto tuvo el dia gratis');
					CantAutosN:=CantAutosN+1;
					 
				end;
			
				If(dia>5) and (dia<=31) then
				begin
					dto:=(dia*horas)*1.5-8;
					writeln('este auto debe pagar un monto de ',dto:4:2);
					CantAutosP:=CantAutosP+1;
				end;
				
				While(dia<>0) do 
				 If(dia>=1) and (dia<=5) then
				 begin
					 CantAutosN:=CantAutosN+1;
					 readln(CantAutosN);
				 end;
end.
					
						
