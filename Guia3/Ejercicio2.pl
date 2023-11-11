invertir_lista([X],[X]).
invertir_lista([X|Xs],R):- invertir_lista(Xs,R1), append(R1,[X],R).
palindromo(Lista):- invertir_lista(Lista,ListaInvertida), Lista = ListaInvertida.
