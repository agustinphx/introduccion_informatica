//11.-Escribir un programa para calcular la velocidad y el consumo por kilómetro de un automóvil.
//Ingresar por teclado la distancia (en kilómetros), el tiempo (en horas) y la cantidad de gasoil empleado.
Program kilometros;
Var
	horas,litros:byte;
	kms:longint;
	velocidad,consumo:real;
Begin
	writeln('Ingrese los kilometros recorridos :');readln(kms);
	writeln('ingrese las horas que tardo :');readln(horas);
	writeln('Ingrese la cantidad de combustible empleado :');readln(litros);
	velocidad:= kms / horas;
	consumo:= litros / kms;
	writeln('La velocidad fue de: ',velocidad:4:2, ' kms por hora y  el consumo fue: ',consumo:4:2, ' litros por km'); 
end.
