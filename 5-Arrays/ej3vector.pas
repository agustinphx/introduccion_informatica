{3 Ingresar en un arreglo N números enteros, generar dos arreglos VPos y VNeg que contendrán
los números positivos y negativos respectivamente. Mostrar el más numeroso, ambos si la cantidad
de elementos coinciden }

Program Ej3Vectores;
TYPE
 TV=array[-100..100] of integer; 

Procedure LeeVector(Var V:TV; Var N:byte);
Var 
	nums:integer;
Begin
	Writeln('Ingrese un numero, 0 fin de datos '); Readln(nums);
	While nums <> 0 do
	Begin
		N:=N+1;
		V[N]:=nums;
		Writeln('Ingrese un numero, 0 fin de datos '); Readln(nums);
	End;
End;

Procedure GeneraOtros(VNums:TV; N:byte; Var VPos:TV; Var VNeg:TV; Var ContPos:byte; Var ContNeg:byte);
Var 
	i:byte;
Begin ContPos:= 0; ContNeg:=0;
  For i:=1 to N do
    if VNums[i] > 0 Then
      Begin
		ContPos:=ContPos+1;
        VPos[ContPos]:=VNums[i]
      end
    else
      Begin
        ContNeg:=ContNeg+1;
        VNeg[ContNeg]:=VNums[i]
      End
End;

Procedure Compara(VPos:TV; VNeg:TV; ContPos:byte; ContNeg:byte); 
Var
	i:byte;
Begin
  writeln('A continuacion se escribiran los numeros del vector mas numeroso');
  if ContPos>ContNeg then
    for i:=1 to ContPos do
      writeln(VPos[i])
  else
    for i:=1 to ContNeg do
      writeln(VNeg[i]);    
End;

VAR 
	N,ContPos,ContNeg:byte; VNums,VPos,VNeg:TV;
Begin
  LeeVector(VNums,N); //Crea el vector y le asigna los numeros
  GeneraOtros(VNums,N,VPos,VNeg,ContPos,ContNeg); {Crea otros dos, positivos y negativos, los almacena en VPos y VNeg y los contadores en ContPos y ContNeg}
  Compara(VPos,VNeg,ContPos,ContNeg){llama procedimiento que compara y me arroja el mas numeroso
}
end.
