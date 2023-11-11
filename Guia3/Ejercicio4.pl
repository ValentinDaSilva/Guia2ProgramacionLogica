miembro_lista(X, [Y|Ys]):- X = Y. 
miembro_lista(X, [Y|Ys]):- miembro_lista(X,Ys). 
buscarLaMayor([X|Xs],X):- buscarLaMayor(Xs,Aux), longitud(X,R1), longitud(Aux,R2), R1 >= R2.
buscarLaMayor([X|Xs],Aux):- buscarLaMayor(Xs,Aux), longitud(X,R1), longitud(Aux,R2), R1 < R2.
buscarLaMayor([X],X).
longitud([],0):- !.
longitud([_|Xs],N):- longitud(Xs,P) ,N is 1+P.
subsecuencia(_,[]).
subsecuencia([X|Xs],[X|Ys]):- subsecuencia(Xs,Ys).
subsecuencia([X|Xs],[Y|Ys]):- subsecuencia(Xs,[Y|Ys]).
esCreciente([X]).
esCreciente([X,Y|Zs]):- X =< Y, esCreciente([Y|Zs]).
lista_crecientes(Lista,Resultado):- listaSecuenciaAux(Lista,Resultado,[]).
listaSecuenciaAux(Lista,[X|L],Aux):- subsecuencia(Lista,X), esCreciente(X) ,not(miembro_lista(X,Aux)), ! ,append(Aux,[X],Aux2), listaSecuenciaAux(Lista,L,Aux2).
listaSecuenciaAux(_,[], Aux). 
subCrecienteMayor(Lista, Sub):- lista_crecientes(Lista,R), buscarLaMayor(R,Sub).