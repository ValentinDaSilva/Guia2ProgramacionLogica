concatenar([],[],[]).
concatenar([],[Y|Ys],[Y|Zs]):- concatenar([],Ys,Zs).
concatenar([X|Xs],Y,[X|Zs]):-concatenar(Xs,Y,Zs).
ultimoElemento([X],X).
ultimoElemento([_|Xs],U):- ultimoElemento(Xs,U).
eliminarUltimoElemento([_|[]],[]).
eliminarUltimoElemento([X|Xs],[X|Zs]):- eliminarUltimoElemento(Xs,Zs).
sufijo([],_).
sufijo([X|Xs],Zs):- ultimoElemento(Zs,U), U = X, eliminarUltimoElemento(Zs,Aux), sufijo(Xs,Aux).
sublista([X|Xs],[Y|Ys]):- X\=Y, sublista([X|Xs],Ys).
sublista([X|Xs],[X|Zs]):- estaCompletamenteIncluida([X|Xs],[X|Zs]), !.
sublista([X|Xs],[X|Zs]):- sublista([X|Xs],Zs).
estaCompletamenteIncluida([],_):- !.
estaCompletamenteIncluida([X|Xs],[X|Zs]):- estaCompletamenteIncluida(Xs,Zs).
ultimo(Elemento, [Elemento]).
ultimo(Elemento, [_|Xs]):- ultimo(Elemento, Xs).
miembro(X, [X|_]).
miembro(X, [_|Ys]):- miembro(X,Ys).
adyacente(X, Y, [X,Y|_]):-!.
adyacente(X, Y, [Z,W|Zs]):- Z\=X, adyacente(X,Y,[W|Zs]).
reversa([X|Xs],Invertida):- reversa(Xs,Auxiliar), concatenar(Auxiliar,[X],Invertida).
reversa([X],[X]).
seleccionar(X,[X],[]).
seleccionar(X,[Y],[Y]):- X\=Y.
seleccionar(X,[X|Ys],Zs):- seleccionar(X,Ys,Zs).
seleccionar(X,[Y|Ys],[Y|Zs]):- X\=Y,seleccionar(X,Ys,Zs).
permuta([], []).
permutar([X|Xs],T):- seleccionar(X,[X|Xs],T). 
eliminar_elemento(_, [], []). % Caso base: Si la lista está vacía, no hay nada que eliminar.

eliminar_elemento(T, [T|Resto], Resto). % Si el elemento actual coincide, lo omitimos.

eliminar_elemento(T, [X|Resto], [X|Resultado]) :-
    X \= T, % Si el elemento actual no coincide, lo mantenemos en la lista.
    eliminar_elemento(T, Resto, Resultado).




