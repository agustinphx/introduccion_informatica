{2 Ingresar M números naturales y luego
a. Contar e informar cuántos elementos son pares, impares y nulos.

b. Multiplicar todos los componentes de posición par por un número ingresado por teclado,
validando que sea diferente de 0, mostrar por pantalla el conjunto de números resultante.

c. Mostrar por pantalla cuál es el lugar donde aparece el máximo (en caso de que este valor
aparezca más de una vez, considerar el primero).
 Ejemplo:
 números : 3 4 8 1 24 3 1 24 15 24  Máximo = 24 lugar= 5 }
Program Guia2Vectores; uses crt;
TYPE TV=array[1..100] of integer;
Var 
	knums,mult:integer; VNums:TV;
    
Procedure CreaVector(Var VNums:TV; knums:integer);
Var
	i:integer;
Begin
     For i:=1 to knums do
     begin
		write('Le pediremos los numeros que compongan el vector. Ingrese numero: ',i);
		Readln(VNums[i]);
       end;
end;
    
Procedure Conteo(Var VNums:TV; knums:integer);
Var 
	i:integer; contpares,contimpares,contnulos:integer;
Begin 
	contpares:= 0; 
	contimpares:= 0; 
	contnulos:= 0;
     For i:=1 to knums do
     Begin 
       if (Vnums[i]) = 0 then
			contnulos:=contnulos+1
        else
			if Odd (Vnums[i]) then
				contimpares:=contimpares+1
			else
				if Not Odd (Vnums[i]) then
				contpares:=contpares+1                  
      end;   
	writeln('La cantidad de pares es ',contpares);
    writeln('La cantidad de impares es ',contimpares);
    writeln('La cantidad de nulos es ',contnulos)  
    end;
    
    Procedure Multiplicar(Var VNums:TV; knums:integer; mult:integer);
    Var 
		i,aux:integer;
    Begin 
      for i:=1 to knums do
        if (VNums[i]) <> 0 then
          Begin
            aux:=(Vnums[i])*mult;
            writeln(aux)
          end;                  
    end;
    
    Procedure maximo(Var VNums:TV; knums:integer);
    Var 
		i,max,pos:integer;
    Begin max:=0;
      for i:=1 to knums do
        if (VNums[i]) > max then
          Begin
            max:=VNums[i];
            pos:=i;
          End;
    writeln('El numero mas alto es ',max);
    writeln('La posicion con el numero mas alto es la numero ',pos)                  
    end;

Procedure repetidos(VNums:TV; knums:integer);
Var 
	ref,conteorep,m,cual,num,numdef,i:integer;
Begin 
	conteorep:=1; 
	cual:=0;
    For i:=1 to knums do //revisame todo el array
    Begin
        ref:= VNums[i]; //el numero de referencia es cada uno del array
        For m:= i + 1 to  knums + 1 do //para cada uno de ellos comparalos con los demas
        Begin
            if VNums[m]=ref then //si el que esta es igual al de referencia
            Begin
                 conteorep:=conteorep + 1; //sumame uno al conteo
                 num:=VNums[m]; //y poneme el numero que se repite, a ver si es el que MAS se repite
            end;
            end;     
            if cual<conteorep then //si es el que mas se repite
            Begin
                cual:=conteorep; //poneme en cual la cantidad de veces q se repite
                conteorep:= 1; //reseteame el conteorep que lo uso en el for arriba nomas
                numdef:=num //en numdef poneme el numero mas repetido, cual es (lo q esta en VNums[m])
            end;                
        end; 
    writeln('El numero que mas se repite es ',numdef);
    writeln('La cantidad de veces que se muestra es ',cual)
    end;
       
Begin clrscr;
    Write('Ingrese la cantidad de numeros que tendra el vector: ');readln(knums);
    CreaVector(VNums,knums); //llama al procedimiento que crea el vector y pide numeros
    Conteo(VNums,knums); //llama al procedimiento que cuenta y muestra pares e impares
    write('Ingrese el numero por el cual quiere multiplicar todo: ');readln(mult);
    multiplicar(VNums,knums,mult); //llama al procedimiento que multiplica por un numero todo
    maximo(VNums,knums); //llama al procedimiento que muestra el mayor numero
    repetidos(VNums,knums) //llama al procedimiento que te da los repetidos
end.
