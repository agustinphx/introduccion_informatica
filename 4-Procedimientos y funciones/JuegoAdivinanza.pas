Program JuegoAdivinanza; //En proceso de revisión, no compila.


Procedure Presentacion;
begin
	writeln('---------');
	writeln('-- El juego de la adivinanza --');
	writeln('---------');
end;

Procedure facil;
Var
	Numero_Azar,Numero_Usuario,Intentos:integer;
	Continuar:char;
begin
	Presentacion;
	Intentos:= 0;
	Numero_Azar:= random(10) + 1;
	
	Repeat
		writeln('Introduzca un numero al azar entre 1 y 10 : ');readl(Numero_Usuario);
		
		If (Numero_Usuario < Numero_Azar) then
			writeln('El numero que busca es mayor')
		Else
			writeln('El numero que busca es menor');
			
		Intentos:= Intentos + 1;	
		
	until(Numero_Usuario = Numero_Azar);
	writeln;
	writeln('Felicidades, acertaste el numero! ',Numero_Azar,' en',Intentos,' intento/s');
	
	
	Repeat	
		writeln('1- Volver a jugar el nivel facil ');
		writeln('2- Volver al menu');
		writeln('3- Salir');
		readln(Continuar);
		clrscr;
		Presentacion;
	until(Continuar = '3');
		
	Case Continuar of
		'1':
		begin
			flag:= false;
			facil;
		end;
		'2':flag:= true;
		'3':flag:= false;
	end;
	
end;

Procedure medio;
Var
	Numero_Azar,Numero_Usuario,Intentos:integer;
	Continuar:char;
begin
	Presentacion;
	Intentos:= 0;
	Numero_Azar:= random(100) + 1;
	
	Repeat
		writeln('Introduzca un numero al azar entre 1 y 100 : ');readl(Numero_Usuario);
		
		If (Numero_Usuario < Numero_Azar) then
			writeln('El numero que busca es mayor')
		Else
			writeln('El numero que busca es menor');
			
		Intentos:= Intentos + 1;	
		
	until(Numero_Usuario = Numero_Azar);
	writeln;
	writeln('Felicidades, acertaste el numero! ',Numero_Azar,' en',Intentos,' intento/s');
	
	
	Repeat	
		writeln('1 - Volver a jugar el nivel medio ');
		writeln('2 - Volver al menu');
		writeln('3 - Salir');
		readln(Continuar);
		clrscr;
		Presentacion;
	until(Continuar = '3');
		
	Case Continuar of
		'1':
		begin
			flag:= false;
			medio;
		'2':flag:= true;
		'3':flag:= false;
		
	end;
	
end;



Procedure dificil;
Var
	Numero_Azar,Numero_Usuario,Intentos:integer;
	Continuar:char;
begin
	Presentacion;
	Intentos:= 0:
	Numero_Azar:= random(1000) + 1;
	
	Repeat
		writeln('Introduzca un numero al azar entre 1 y 10 : ');readl(Numero_Usuario);
		
		If (Numero_Usuario < Numero_Azar) then
			writeln('El numero que busca es mayor')
		Else
			writeln('El numero que busca es menor');
			
		Intentos:= Intentos + 1;	
		
	until(Numero_Usuario = Numero_Azar);
	writeln;
	writeln('Felicidades, acertaste el numero! ',Numero_Azar,' en',Intentos,' intento/s');
	
	
	Repeat	
		writeln('1- Volver a jugar el nivel dificil ');
		writeln('2- Volver al menu');
		writeln('3- Salir');
		readln(Continuar);
		clrscr;
		Presentacion;
	until(Continuar = '3');
		
	Case Continuar of
		'1':
		begin
			flag:= false;
			dificil;
		'2':flag:= true;
		'3':flag:= false;
		
	end;
	
end;

Procedure Menu;
Var
	Opcion:char;
begin
	Presentacion;
	
	Repeat
		writeln('1 Nivel facil. Adinive un numero entre 1 y 10');
		writeln('2 Nivel medio: Adivine un numero entre 1 y 100');
		writeln('3 Nivel dificil: Adivine un numero entre 1 y 1000');
		writeln('4 Salir');
		readln(Opcion);
		Until(Opcion = '4');
		
		Case Opcion of
			'1': facil;
			'2': medio;
			'3': dificil;
			'4':flag:= false;
		end;
end;

Var
	flag:boolean;

Begin
	randomize;
	flag:= false;
	Repeat
		menu;
	Until(Not flag);
end.
