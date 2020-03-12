program pasajeros;
uses crt;
var 
	archivo: text;
        // Código del vuelo, limitamos a 3 caracteres
    codigoDeVuelo, masPesado: string[3];
        // Categoría y peso, selfexplained
        // Sobrepeso individual
     categoria: char;
     peso, sobrepeso: byte;
        // Cantidad de pasajeros podría ser una cantidad que sobre pase el límite del byte,
        // de la misma manera lo podrían hacer los sobrepesos de A, B, C y en consecuencia también el Total
        // El auxiliar I tiene que estar en la magnitud del valor que puede llegar a tomar -> Cantidad de Pasajeros
     i, cantidadDePasajeros, sobrepesoA, sobrepesoB, sobrepesoC, sobrepesoTotal, mayorSobrepeso: word;

function calcularSobrepeso (categoria:char;peso:byte):byte;
begin
    if ((categoria = 'A') and (peso > 40)) then
        calcularSobrepeso := peso - 40
    else if ((categoria = 'B') and (peso > 30)) then
        calcularSobrepeso := peso - 30
    else if ((categoria = 'C') and (peso > 23)) then
        calcularSobrepeso := peso - 23
    else
        calcularSobrepeso := 0;
end;

Begin
    assign(archivo, 'pasajeros.txt');
    reset(archivo);
    mayorSobrepeso := 0;
    while not eof(archivo) do
        begin
            // Reseteamos los Valores
            sobrepesoA := 0;
            sobrepesoB := 0;
            sobrepesoC := 0;
            sobrepesoTotal:= 0;
            readln(archivo, codigoDeVuelo, cantidadDePasajeros);
            writeln('Vuelo: ', codigoDeVuelo);
            // Resolvemos A, de cada pasajero kilos excedidos
            for i:= 1 to cantidadDePasajeros do
                begin
                    readln(archivo, categoria, peso);
                    sobrepeso := calcularSobrepeso(categoria, peso);
                    case categoria of
                        'A':sobrepesoA := sobrepesoA + calcularSobrepeso(categoria, peso);
                        'B':sobrepesoB := sobrepesoB + calcularSobrepeso(categoria, peso);
                        'C':sobrepesoC := sobrepesoC + calcularSobrepeso(categoria, peso);
                    end;
                    writeln('Sobrepeso del Pasajero ',i,': ', sobrepeso);
                end;
            // Resolvemos B, del total de sobrepeso en cada cateogoría
            writeln('Sobrepeso en categoria A: ', sobrepesoA);
            writeln('Sobrepeso en categoria B: ', sobrepesoA);
            writeln('Sobrepeso en categoria C: ', sobrepesoA);
            // Acá vemos cual es el vuelo con mayor sobrepeso
            sobrepesoTotal := sobrepesoA + sobrepesoB + sobrepesoC;
            if sobrepesoTotal > mayorSobrepeso then
                begin
                    mayorSobrepeso := sobrepesoTotal;
                    masPesado := codigoDeVuelo;
                end;
            writeln('-----');
        end;
    // Resolvemos C, el código de vuelo de mayor sobrepeso
    writeln(masPesado);
    close(archivo);
End.
