arbol(Raiz, nil, nil).
arbol_binario(nil).
arbol_binario(arbol(Raiz,Izq,Der)):- arbol_binario(Izq),arbol_binario(Der).
pesoArbol(arbol_binario(arbol(Raiz,Izq,Der)), N):- pesoArbolAux(arbol_binario(arbol(Raiz,Izq,Der)), 0 ,N).
pesoArbolAux(arbol_binario(arbol(Raiz,Izq,Der)), Indice ,N):- 
 Indice2 is Indice + 1, 
 pesoArbolAux(arbol_binario(Izq),Indice2,N2),
 pesoArbolAux(arbol_binario(Der),Indice2,N3),
 N is Raiz * Indice + N2 + N3.
pesoArbolAux(arbol_binario(arbol(Raiz,nil,Der)), Indice ,N):- 
    Indice2 is Indice + 1, 
    pesoArbolAux(arbol_binario(Der),Indice2,N2),
    N is Raiz * Indice + N2.
pesoArbolAux(arbol_binario(arbol(Raiz,Izq,nil)), Indice ,N):- 
    Indice2 is Indice + 1, 
    pesoArbolAux(arbol_binario(Izq),Indice2,N2),
    N is Raiz * Indice + N2.
pesoArbolAux(arbol_binario(arbol(Raiz,nil,nil)), Indice ,N):- 
    N is Raiz * Indice.
mapeoArboles([X,Y], Y):-  pesoArbol(X,R), pesoArbol(Y,R2), R > R2.
mapeoArboles([X,Y], X):-  pesoArbol(X,R), pesoArbol(Y,R2), R =< R2.
mapeoArboles([arbol_binario(arbol(Raiz,Izq,Der))|Xs], arbol_binario(arbol(Raiz,Izq,Der))):- pesoArbol(arbol_binario(arbol(Raiz,Izq,Der)),R), mapeoArboles(Xs,R2), pesoArbol(R2,R3), R < R3.
mapeoArboles([arbol_binario(arbol(Raiz,Izq,Der))|Xs], R2):- pesoArbol(arbol_binario(arbol(Raiz,Izq,Der)),R), mapeoArboles(Xs,R2), pesoArbol(R2,R3), R >= R3.