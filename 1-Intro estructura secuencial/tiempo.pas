//4-Escriba un programa donde se ingrese el tiempo necesario para un cierto proceso en horas, minutos y segundos. 
//Calcule el costo total del proceso sabiendo que el costo por segundo es 0,25$. (Debe salir por pantalla el
//tiempo expresado en horas, minutos y segundos, el costo por segundo y el costo total)
Program tiempo4;
Var
	horas,minutos,segundos:byte;
	costoSeg,costoTotal:real;
Begin
writeln('ingrese la cantidad de horas :');readln(horas);
writeln('ingrese la cantidad de minutos :');readln(minutos);
writeln('ingrese la cantidad de segundos :');readln(segundos);
costoSeg:= segundos * 0.25;
costoTotal:= horas * minutos * costoSeg;
writeln(' el tiempo del proceso es :',horas, ' horas ',minutos, ' minutos ',segundos,' segundos con un costo total de : $',costoTotal:2:0);

end.
