Program peso;

Var
	pesoI,pesoF:byte;
	porcentaje:real;
Begin
writeln('ingrese el peso inicial :');readln(pesoI);
writeln('ingrese el peso final :');readln(pesoF);
porcentaje:=(pesoI - pesoF) /pesoI*100;
writeln('el porcentaje que perdio de peso es :',porcentaje:4:2,'%');readln(porcentaje);
end.
