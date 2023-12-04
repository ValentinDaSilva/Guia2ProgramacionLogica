arbol(_, nil, nil).
arbol_binario(nil).
arbol_binario(arbol(_,Izq,Der)):- arbol_binario(Izq),arbol_binario(Der).
raiz(arbol(Raiz,_,_),Raiz).
hijos(arbol(_,Izq,Der),[Izq,Der]):- Izq \= nil, Der \= nil.
hijos(arbol(_,nil,nil),[]):- !.
hijos(arbol(_,Izq,nil),[Izq]). 
hijos(arbol(_,nil,Der),[Der]).

recorrido_horizontal(arbol(Raiz,Izq,Der), Lista):- recorridoAux(Xs,[Izq,Der]), listaAtomos([Raiz|Xs],Lista).
recorridoAux([],[]):-!.
recorridoAux([R|Xs],ListaHijos):- sacarRaizATodos(ListaHijos,R), sacarHijos(ListaHijos,RH) , listaAtomos(RH,RH2) , recorridoAux(Xs, RH2). 
sacarRaizATodos([],[]).
sacarRaizATodos([X|Xs],[R|Rs]):- raiz(X,R), sacarRaizATodos(Xs,Rs).
sacarHijos([],[]).
sacarHijos([X|Xs],[R|Rs]):- hijos(X,R), sacarHijos(Xs,Rs).
listaAtomos([],[]).
listaAtomos([X|Xs],Lista):- is_list(X), listaAtomos(X,Lista2), listaAtomos(Xs,Lista3), append(Lista2,Lista3,Lista). 
listaAtomos([X|Xs],[X|Ys]):- not(is_list(X)), listaAtomos(Xs,Ys). 
% arbol(1,arbol(2,arbol(4,nil,nil),arbol(5,nil,nil)),arbol(3,arbol(6,nil,nil),arbol(7,nil,nil))).



