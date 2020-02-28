Program learn;

Function naturales(a,b:word):integer;

Var
	
	n,i,num:integer;
	
Begin
	 writeln('ingrese un numero');
	 readln(num);
	 
	 If(a>0) then
	 begin
	    writeln(a,'es un numero natural')
	    Else 
			writeln(a,'no es un numero natural');
	 end;
	 If(b>0) then
	 begin
		writeln(b,'es un numero natural')
		Else
			writeln(b,'no es un numero natural');
	 end;
	 For i:=1 to n do 
	 Begin
		writeln('numero natural ',num);
		readln(num);
	 end;
end.
			
