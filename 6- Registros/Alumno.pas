{
a) Declarar registros para los campos: fecha(dia,mes,anio),exámen(fecha,nota) anidado, materia(codigo,examenes y un contador de estos) alumno(matricula,materia).
b) Escribir del alumno i, la materia j, el mes del examen k.
}
Program Alumno;

Type // a.
	TRF = Record
	dd,mm:byte;
	aa:word;
end;
	TRExam = Record
	Fecha:TRF;
	Nota:real;
end;
	TRMateria = Record
	Codigo:string[4];
	Examenes:array [1..10] of TRExam;
	ContE:byte;
end;
	TRAlumn = Record
	Matricula:string[4];
	Materia:array [1..20] of TRMateria;
end;
TVAlum = array [1..100] of TRAlumn;

Var
	V:TVAlum;
	i,j,k:byte;
Begin
	write(V[i].Materia[j].Examenes[k].Fecha.mm); // b.
End.
