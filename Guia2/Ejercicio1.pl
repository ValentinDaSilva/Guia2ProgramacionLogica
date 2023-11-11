
persona(documento(tipo('DNI'),numero(10345908)),nombre('Jose', 'Luis', 'Perez'),direccion(calle('Talcahuano'),numero(230))).
persona(documento(tipo('DNI'), numero(11346977)), nombre('Roberto', 'Juan', 'Marin'),direccion(calle('Cullen'), numero(6740))).
persona(documento(tipo('DNI'), numero(11746988)), nombre('Federico', 'Daniel', 'Fernandez'), direccion(calle('Cullen'), numero(6740))).

ocupacion(documento(tipo('DNI'), numero(10345908)), cargo(supervisor),area(contable)).
ocupacion(documento(tipo('DNI'), numero(11346977)), cargo(supervisor), area(contable)).
ocupacion(documento(tipo('DNI'), numero(11746988)), cargo(oficinista), area(personal)).

salario(cargo(supervisor), area(contable), 650000).
salario(cargo(oficinista), area(contable), 540000).
salario(cargo(oficinista), area(personal), 480000).
salario(cargo(supervisor), area(taller), 630000).

salario([N1,N2,N3],Monto):- persona(documento(tipo(_),numero(X)),nombre(N1,N2,N3),direccion(calle(_),numero(_))),ocupacion(documento(tipo('DNI'),numero(X)),cargo(C),area(A)),salario(cargo(C),area(A),Monto).
direccion([N1,N2,N3],[Calle,Numero]):- persona(documento(tipo(_),numero(_)),nombre(N1,N2,N3),direccion(calle(Calle),numero(Numero))).
direccion([N1,N2,N3],[X,Y]):- persona(documento(tipo(_),numero(_)),nombre(N1,N2,N3),direccion(X,Y)). /*Otra alternativa que muestra los datos distintos*/
cargo([N1,N2,N3], Cargo):- persona(documento(tipo(_),numero(DNI)),nombre(N1,N2,N3),direccion(calle(_),numero(_))),ocupacion(documento(tipo(_),numero(DNI)),cargo(Cargo),area(_)).
documento([N1,N2,N3],[Tipo,Numero]):- persona(documento(tipo(Tipo),numero(Numero)),nombre(N1,N2,N3),direccion(calle(_),numero(_))).
