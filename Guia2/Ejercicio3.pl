/* verificar si ocurre un elemento en la lista, la lista puede tener listas anidadas y tambien se debe verificar en ellas */

ocurre(Elem,[Elem|Xs]).
ocurre(Elem, [X|Xs]):- is_list(X), not(not(ocurre(Elem,X))).
ocurre(Elem, [X|Xs]):- ocurre(Elem,Xs).
