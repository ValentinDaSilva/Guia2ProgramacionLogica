ciudad(dresde, alemania).
ciudad(basilea, suiza).
ciudad(roma, italia).
ciudad(hamburgo, alemania).
ciudad(atenas, grecia).
ciudad(venecia, italia).
ciudad(colonia, alemania).
ciudad(viena, austria).
ciudad(florencia, italia).
ciudad(munich, alemania).
ciudad(berna, suiza).

tour(Lista,T):- permutar(Lista,T), recorridoValido(T,[]).
recorridoValido([],_).
recorridoValido([T|Ts],Aux):- ciudad(T,Pais), not(miembro(Pais,Aux)), ! , append(Aux,[Pais],Aux2), recorridoValido(Ts,Aux2).
recorridoValido([T|Ts],Aux):- ciudad(T,Pais), miembro(Pais,Aux), ultimoElemento(Aux,Pais),recorridoValido(Ts,Aux).
ultimoElemento([X],X).
ultimoElemento([_|Xs],R):- ultimoElemento(Xs,R).
permutar([X],[X]).
permutar(Lista,[X|RestoDePermutaciones]):- seleccionar(X,Lista,Resto), permutar(Resto,RestoDePermutaciones).
seleccionar(X,[X|Xs],Xs).
seleccionar(X,[Y|Ys],[Y|Zs]):- seleccionar(X,Ys,Zs). 
miembro(X,[X|_]):- !.
miembro(X,[_|Ys]):- miembro(X,Ys).
