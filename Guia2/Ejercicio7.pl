longitud([_],1):- !.
longitud([_|Xs],N):- longitud(Xs,P) ,N is 1+P.
max([X],[Y],X):- X >= Y.
max([X],[Y],Y):- X < Y.
min([X],[Y],Y):- X >= Y.
min([X],[Y],X):- X < Y.
enesimo([X|Xs], N, Elemento):- enesimo(Xs,N1,Elemento), N is N1+1.
enesimo([Elemento|Xs],1,Elemento).
suma_lista([X],X):- number(X).
suma_lista([X|Xs], Suma):- number(X),suma_lista(Xs,Suma1), Suma is X+Suma1.
miembro(X,[X|_]).
miembro(X,[Y|Ys]):- miembro(X,Ys).
sin_repetidos([X],[X]).
sin_repetidos([X|Xs],Zs):- sin_repetidos(Xs,Ws), not(miembro(X,Ws)), append([X],Ws,Zs).
sin_repetidos([X|Xs],Ws):- sin_repetidos(Xs,Ws), miembro(X,Ws).
ordenada([X],[X]).
ordenada([X|Xs],R):- ordenada(Xs,R1), insertarEnOrden(X,R1,R).
insertarEnOrden(E, [], [E]):- !.
insertarEnOrden(E, [X|Xs],[E, X| Xs]):- E=<X.
insertarEnOrden(E,[X|Xs],[X|R]):- E>X, insertarEnOrden(E,Xs,R).
reemplaza([],_,_,[]).
reemplaza([Original|Xs],Original,Reemplazo,[Reemplazo|Zs]):- reemplaza(Xs,Original,Reemplazo,Zs).
reemplaza([X|Xs],Original,Reemplazo,[X|Zs]):- X\=Original,reemplaza(Xs,Original,Reemplazo,Zs).
elimina([],_,[]).
elimina([Elemento|Xs],Elemento,Zs):- elimina(Xs,Elemento,Zs).
elimina([X|Xs],Elemento,[X|Zs]):-X\=Elemento, elimina(Xs,Elemento,Zs).


