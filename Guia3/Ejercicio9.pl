actualizar(Tabla,[X],TA):- actualizar2(Tabla,X,TA).
actualizar(Tabla,[X|Xs], TA):- actualizar2(Tabla,X,TA1), actualizar(TA1,Xs,TA).
actualizar2(Tabla,[Equipo1, Equipo2, 1], TA):- modificarEquipoGanador(Tabla,Equipo1,3,TA1), modificarEquipoPerdedor(TA1,Equipo2,TA).
actualizar2(Tabla,[Equipo1, Equipo2, 2], TA):- modificarEquipoGanador(Tabla,Equipo2,3,TA1), modificarEquipoPerdedor(TA1,Equipo1,TA).
actualizar2(Tabla,[Equipo1, Equipo2, 3], TA):- empate(Tabla,Equipo2,TA1), empate(TA1,Equipo1,TA).

modificarEquipoGanador([X|Xs],Equipo,Valor,[R2|Xs]):- posicion(X,1,R), R = Equipo, modificarEquipoGanadorAux(X,Valor,R2).
modificarEquipoGanador([X|Xs],Equipo,Valor,[X|Zs]):- posicion(X,1,R), R \= Equipo, modificarEquipoGanador(Xs,Equipo,Valor,Zs).
modificarEquipoGanadorAux([E,P,PG,PE,PP],Valor,[E,P2,PG2,PE,PP]):- P2 is P + Valor, PG2 is PG + 1.

modificarEquipoPerdedor([X|Xs],Equipo,[R2|Xs]):- posicion(X,1,R), R = Equipo, modificarEquipoPerdedorAux(X,R2).
modificarEquipoPerdedor([X|Xs],Equipo,[X|Zs]):- posicion(X,1,R), R \= Equipo, modificarEquipoPerdedor(Xs,Equipo,Zs).
modificarEquipoPerdedorAux([E,P,PG,PE,PP],[E,P,PG,PE,PP2]):- PP2 is PP + 1.

empate([X|Xs],Equipo,[R2|Xs]):-  posicion(X,1,R), R = Equipo, modificarEmpate(X,R2).
empate([X|Xs],Equipo,[X|Zs]):-  posicion(X,1,R), R \= Equipo, empate(Xs,Equipo, Zs).
modificarEmpate([E,P,PG,PE,PP],[E,P2,PG,PE2,PP]):- P2 is P + 1,PE2 is PE + 1.

posicion([X|_],1,X).
posicion([_|Xs],Indice,Resultado):- Indice2 is Indice - 1, posicion(Xs,Indice2,Resultado).