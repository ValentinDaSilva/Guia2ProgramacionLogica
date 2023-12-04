nodo(_,[]).
esHoja(nodo(_,[])).
devolverRaiz(nodo(Raiz,[]),Raiz).
cantidad(nodo(_,[]),1):- !.
cantidad(nodo(_,Lista),R):- cantidad_lista(Lista,R1), R is R1 + 1.
cantidad_lista([],0).
cantidad_lista([X|Xs],R):- cantidad(X,R1), cantidad_lista(Xs,R2), R is R1 + R2. 
listar_hojas(nodo(c,[]),[c]):- !.
listar_hojas(nodo(X,Lista),L):- listar_hojas(Lista,L1), listaAtomos(L1,L).
listar_hojas([],[]).
listar_hojas([X|Xs],[R|Rs]):- esHoja(X), devolverRaiz(X,R), listar_hojas(Xs,Rs).
listar_hojas([X|Xs],[R|Rs]):- not(esHoja(X)), listar_hojas(X,R), listar_hojas(Xs,Rs).
listaAtomos([],[]).
listaAtomos([X|Xs],Lista):- is_list(X), listaAtomos(X,Lista2), listaAtomos(Xs,Lista3), append(Lista2,Lista3,Lista). 
listaAtomos([X|Xs],[X|Ys]):- not(is_list(X)), listaAtomos(Xs,Ys). 
quitarHojas([],[]).
quitarHojas([X|Xs],Zs):- esHoja(X), quitarHojas(Xs,Zs).
quitarHojas([X|Xs],[X2|Zs]):- not(esHoja(X)), quitarHojas(X,X2), quitarHojas(Xs,Zs).
quitarHojas(nodo(X,Lista),nodo(X,Lista2)):- not(esHoja(nodo(X,Lista))), quitarHojas(Lista,Lista2). 

arbol(Arbol):- Arbol = nodo(a, [
    nodo(b, [nodo(e, []), nodo(f, []),
    nodo(g, [])]),
    nodo(c, []),
    nodo(d, [nodo(h, [])])
    ]
    ).
