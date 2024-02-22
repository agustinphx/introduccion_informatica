{Se desea modelar un juego compuesto por N héroes y villanos.
Cada personaje del juego posee un nombre del super héroe(Capitán América,
Mujer Maravilla,Pantera Negra,Deadpool,etc). y hasta M cualidades tales como 'A' Agilidad,
'F' Fuerza, 'V' Velocidad, 'C' Camuflaje, 'I' Inmortalidad.
Cada una de ellas posee un nivel de poder asociado que varía según la capacidad de cada 
personaje.
Se pide desarrollar un programa Pascal,eficaz,claro y eficiente que lea de archivo los datos
de cada personaje para calcular e informar:
A) Cuál es la cualidad de mayor nivel de cada personaje?
B( Cuántos personajes tienen las M cualidades?
RESULTADOS:  
A) Capitan américa : F
   Mujer Maravilla: C
   Pantera Negra: A
	Deadpool: I

B) Cantidad de personajes con las 5 cualidades: 1 (Mujer Maravilla).
}
Program Heroes;

Var
	Nom:string;
	Cuali,MaxC:char;
	Poder,Max:word;
	N,i,Cont,Cont5:byte;
	arch:text;
Begin
	assign(arch,'Heroes.txt');reset(arch);
	readln(arch,N);
	Cont5:= 0;
	For i:= 1 to N do
	begin
		Max:= 0;
		Cont:= 0;
		readln(arch,Nom);
		read(arch,Cuali);
		while (Cuali <> '*') do
		begin
			readln(arch,Poder);
			Cont:= Cont + 1;
			If (Poder > Max) then
			begin
				Max:= Poder;
				MaxC:= Cuali;
			end;
			read(arch,Cuali);
		end;
		readln(arch);
		If (Cont = 5) then
			Cont5:= Cont5 + 1;
		writeln;
		writeln('A- ',Nom,' capacidad de mayor nivel: ',MaxC,' con un poder de: ',Max);
	end;
	close(arch); 
	writeln;
	writeln;
	writeln('B- Cantidad de heroes con las 5 cualidades: ',Cont5);
End.
