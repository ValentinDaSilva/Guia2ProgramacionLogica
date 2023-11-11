listaAtomos([],[]).
listaAtomos([X|Xs],Lista):- is_list(X), listaAtomos(X,Lista2), listaAtomos(Xs,Lista3), append(Lista2,Lista3,Lista). 
listaAtomos([X|Xs],[X|Ys]):- not(is_list(X)), listaAtomos(Xs,Ys). 