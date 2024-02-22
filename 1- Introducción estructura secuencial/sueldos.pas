// Calcular e imprimir el sueldo bruto y neto de un empleado. Considerar la paga de $8 la hora,
//un descuento del 11% previsional y el 5% para cobertura médica. La cantidad de horas trabajadas es un dato de entrada.
Program sueldo;
Var
	horas:byte;
	sueldoBruto,sueldoNeto:real;
Begin	
	writeln('ingrese la cantidad de horas trabajadas :');readln(horas);
	sueldoBruto:= horas * 8;
	sueldoNeto:= sueldoBruto * 0.84; // 16% de descuento entre aportes y cobertura medica.
	writeln('Su sueldo bruto es :',sueldoBruto:4:2, ' / su sueldo neto es :',sueldoNeto:4:2);
end.
