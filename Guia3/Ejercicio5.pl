generarSubListas([],_,[],[]).
generarSubListas(X,0,[],X):-!.
generarSubListas([X|Xs],Indice,[X|Zs],R):- Indice2 is Indice - 1,generarSubListas(Xs,Indice2,Zs,R).
todasLasSubListas([],_,[]):-!.
todasLasSubListas(X,Indice,[S|Zs]):- generarSubListas(X,Indice,S,R), todasLasSubListas(R,Indice,Zs),!.
merge1([],[],[]).
merge1([],[Y|Ys],[Y|Ys]).
merge1([X|Xs],Y,[X|Zs]):- merge2(Xs,Y,Zs).
merge2([],[],[]).
merge2([X|Xs],[],[X|Xs]).
merge2(X,[Y|Ys],[Y|Zs]):- merge1(X,Ys,Zs).
listaAtomos([],[]):- !.
listaAtomos([X|Xs],Lista):- is_list(X), listaAtomos(X,Lista2), listaAtomos(Xs,Lista3), append(Lista2,Lista3,Lista). 
listaAtomos([X|Xs],[X|Ys]):- not(is_list(X)), listaAtomos(Xs,Ys). 
intercala(L1,L2,LT1,LT2,X):- todasLasSubListas(L1,LT1,R),todasLasSubListas(L2,LT2,R2),merge1(R,R2,R3), !, listaAtomos(R3,X).

