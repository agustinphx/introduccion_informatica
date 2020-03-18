//A partir del peso inicial y final que registro una persona en un tratamiento para adelgazar,
//calcular e informar el porcentaje que perdió con respecto al peso inicial
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
