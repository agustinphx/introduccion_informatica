// Cree un algoritmo que permita determinar la calificación en letras
// Si la nota se encuentra entre 90 a 100 = A
// Si la nota se encuentra entre 80 a 89  = B
// Si la nota se encuentra entre 70 a 79  = C
// Si la nota se encuentra entre  60 a 69 = D
// Si la nota es inferior a 60            = F
Program notas;
Var
	Nota:byte;
	letra:char;
Begin
write('ingrese la nota : '); readln(Nota);
If ( Nota >= 90) and ( Nota <=100) then
begin
	letra:= 'A';
	write('la calificacion es :',letra);
end	
Else if ( Nota >= 80) and ( Nota <=89) then
begin
	letra:= 'B';
	write('la calificacion es :',letra);
		end	
Else If ( Nota >=70) and ( Nota <=79) then
begin
	Letra:= 'C';
	write('El alumno obtuvo la calificacion : ',letra);	
end
Else If ( Nota >= 60) and ( Nota <=69) then
begin
	Letra:= 'D';
	write('El alumno obtuvo la calificacion : ',letra);
end	
Else If ( Nota < 60 ) then
begin	
	Letra:= 'F';
	write('El alumno obtuvo la calificacion : ',letra);
end;
end.



//write('la calificacion es :',letra); 
