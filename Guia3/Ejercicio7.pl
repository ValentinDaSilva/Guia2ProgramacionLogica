% Seleccionado jugador(Apellido,Numero), Seleccion.
seleccionado(jugador("Messi", 10), "argentina").
seleccionado(jugador("Karacic", 5), "australia").
seleccionado(jugador("Estrada", 11), "ecuador").
seleccionado(jugador("Mendy", 6), "senegal").

% Partido ID del partido, equipo1 , equipo2, goles equipo1, goles equipo2.
partido(35, "ecuador", "senegal", 1, 2).
partido(21, "tunez", "australia", 0, 1).
partido(61, "argentina", "croacia", 3, 0).
partido(50, "argentina", "australia", 2, 1).
partido(18, "qatar", "senegal", 1, 3).
partido(8, "argentina", "arabia", 1, 2).
partido(1, "qatar", "ecuador", 0, 2).
partido(39, "polonia", "argentina", 0, 2).

% Presencia, ID del partido que jugo, jugador(nombre,posiciom)
presencia(21, jugador("Karacic", 5)).
presencia(35, jugador("Mendy", 6)).
presencia(8, jugador("Messi", 10)).
presencia(61, jugador("Messi", 10)).
presencia(1, jugador("Estrada", 11)).
presencia(39, jugador("Messi", 10)).
presencia(18, jugador("Mendy", 6)).
presencia(50, jugador("Messi", 10)).

% Dar el apellido de un jugador y fijarse si gano los partidos que jugo
equipoGanador(ID,Equipo1):- partido(ID, Equipo1, _, Goles1, Goles2), Goles1 > Goles2 .
equipoGanador(ID,Equipo2):- partido(ID, _, Equipo2, Goles1, Goles2), Goles1 < Goles2 .
seleccionGanoTodosLosPartidos([],_).
seleccionGanoTodosLosPartidos([X|Xs],Seleccion):- equipoGanador(X,Seleccion),seleccionGanoTodosLosPartidos(Xs,Seleccion).

jugadoresVictoriosos(L):- listaJugadores(X),jugadoresVictoriososAux(X,L).
jugadoresVictoriososAux([],[]).
jugadoresVictoriososAux([X|Xs],[X|Zs]):- partidosJugados(X,L), ganoSusPartidos(X,L), jugadoresVictoriososAux(Xs,Zs).
jugadoresVictoriososAux([X|Xs],Zs):- partidosJugados(X,L), not(ganoSusPartidos(X,L)), jugadoresVictoriososAux(Xs,Zs).

partidoJugado([X,Y,Z]):- partido(X, Y, Z, _, _).
ganoSusPartidos(Jugador,Lista):- seleccionado(jugador(Jugador, _), Seleccion), seleccionGanoTodosLosPartidos(Lista,Seleccion).

partidosJugados2(Ps):- listaPartidosJugados(L), ordenarMenorAMayor(L,Ps).

ordenarMenorAMayor([],[]).
ordenarMenorAMayor(Lista,[R1|Zs]):- buscarElMenor(Lista,R1), eliminarElemento(Lista,R1,R2), ordenarMenorAMayor(R2,Zs).

eliminarElemento([],_,[]).
eliminarElemento([Elemento|Xs],Elemento,Zs):- eliminarElemento(Xs,Elemento,Zs).
eliminarElemento([X|Xs],Elemento,[X|Zs]):- X\=Elemento, eliminarElemento(Xs,Elemento,Zs).

buscarElMenor([X],X).
buscarElMenor([X|Xs],R1):-  buscarElMenor(Xs,R1), posicion(R1,1,R2), posicion(X,1,R3), R2 < R3. 
buscarElMenor([X|Xs],X):-  buscarElMenor(Xs,R1), posicion(R1,1,R2), posicion(X,1,R3), R2 >= R3. 

menor(X,Y,X):- X =< Y , !.
menor(X,Y,Y).
posicion([X|_], 1, X).
posicion([X|Xs],Indice,Resultado):- Indice2 is Indice - 1, posicion(Xs, Indice2, Resultado).

listaPartidosJugados(X):- listaPartidosJugadosAux(X,[]).
listaPartidosJugadosAux([X|L],Aux):- partidoJugado(X), not(miembro(X,Aux)), !, append(Aux,[X],Aux2), listaPartidosJugadosAux(L,Aux2).
listaPartidosJugadosAux([],_).

listaJugadores(L):- listaJugadoresAux(L,[]).
listaJugadoresAux([X|L],Aux):- seleccionado(jugador(X, _), _), not(miembro(X,Aux)), ! , append(Aux,[X],Aux2), listaJugadoresAux(L,Aux2).
listaJugadoresAux([],_).

partidosJugados(Jugador,ListaPartidos):- partidosJugadosAux(Jugador,ListaPartidos,[]).
partidosJugadosAux(Jugador, [X|L], Aux):- presencia(X, jugador(Jugador,_)), not(miembro(X,Aux)), ! , append(Aux,[X],Aux2),partidosJugadosAux(Jugador,L,Aux2).
partidosJugadosAux(_,[],_). 
% Auxiliares
miembro(X, [X|_]):- !.
miembro(X, [_|Ys]):- miembro(X,Ys).