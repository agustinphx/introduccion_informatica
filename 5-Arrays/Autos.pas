  Program EjArrayParalelosTexto; uses crt;
  Type
    st6=string[6];
    TVPat=array[1..100] of st6;
    TVA=array[1..100] of word;
    TVP=array[1..100] of longint;

  Procedure LeeVector(Var TVAno:TVA; Var TVPrec:TVP; Var TVPt:TVPat; Var N:Byte);
  Var 
	Arch:text; basura:char;
  Begin
    Assign(Arch,'Autos.txt'); Reset(Arch);
    N:=0;
    while not eof(Arch) do
      Begin
        N:=N+1;
        Readln(Arch,TVPt[N],basura,TVAno[N],basura,TVPrec[N]);
      End;
  Close(Arch);
  End;

  Procedure PrecioMinimo(TVAno:TVA; TVPrec:TVP; N:Byte);
  Var 
	anio:word; minimo:longint; i:byte;
  Begin 
	minimo:=999999;
    writeln('Ingrese el anio del cual quiere saber el precio minimo'); readln(anio);
    for i:=1 to N do
      Begin
		if anio = TVAno[i] then
          Begin
            if TVPrec[i] < minimo then
                minimo:=TVPrec[i]
          end
      end;
    if minimo=999999 then
      writeln('No hay vehiculos de ese anio')
    else
      writeln('El auto mas barato de ese anio sale ',minimo)
   end;
   
  Procedure BajoValor(TVAno:TVA; TVPrec:TVP; N:Byte);
  Var 
	i,cant:byte; precio:longint;
  Begin 
	cant:=0;
    writeln('Ingrese el precio de referencia'); readln(precio);
    for i:=1 to N do
      Begin
        if precio>TVPrec[i] then
          cant:=cant+1;
      end;
    if cant>0 then
      writeln('La cantidad de vehiculos por debajo de ese valor es ',cant)
    else
      writeln('No hay vehiculos por debajo de ese valor')   
  end;
  
 
  Procedure PromedioRango(TVAno:TVA; TVPrec:TVP; N:byte);
  Var 
	i,cant:byte; anioinf,aniosup:longint; preciolocal:longint; promedio:real;
  Begin
   preciolocal:=0; cant:=0;
    writeln('Ingrese el anio inferior'); readln(anioinf);
    writeln('Ingrese el anio superior'); readln(aniosup);
    for i:=1 to N do
      Begin
        if anioinf <= (TVAno[i]) then
          if aniosup >= (TVAno[i]) then
            Begin
              cant:=cant+1;
              preciolocal:=preciolocal+TVPrec[i];
            End;
      end;
    if (preciolocal > 0) then
      Begin
        promedio:=preciolocal/cant;
        writeln('El precio promedio entre esos anios es de $',promedio:6:0)
      end
    else
      writeln('No existen autos en esos anios');   
  End;
  
  Procedure Patentes(TVAno:TVA; TVPt:TVPat; N:byte; VAR TVPatNuevo:TVPat);
  Var 
	i:byte;
  Begin
    for i:=1 to N do
    Begin
      if (TVAno[i] > 2018) then
        TVPatNuevo[i]:=TVPt[i]
    end;
    
    for i:=1 to N do
    Begin
      writeln('Las patentes posteriores a 2018 son');
      writeln(TVPatNuevo[i])
    end
  end;
  
   
  Var TVAno:TVA; TVPrec:TVP; TVPt,TVPatNuevo:TVPat; N:byte; opcion:char;
  Begin clrscr;
    LeeVector(TVAno,TVPrec,TVPt,N);
    writeln('------------BIENVENIDO, QUE QUIERE HACER?------------');
    writeln();
    writeln('1: Calcular el precio minimo de un vehiculo de X anio');
    writeln('2: Calcular la cantidad de autos por debajo de un X precio');
    writeln('3: Calcular el precio promedio de un rango de anios');
    writeln('4: Calcular las patentes posteriores a 2018');
    writeln();
    readln(opcion);
    
    if opcion='1' then
      PrecioMinimo(TVAno,TVPrec,N)
    else if opcion='2' then
      BajoValor(TVAno,TVPrec,N)
    else if opcion='3' then
      PromedioRango(TVAno,TVPrec,N)
    else if opcion='4' then
      Patentes(TVAno,TVPt, N, TVPatNuevo);
    
  End. 
