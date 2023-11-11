subsecuencia(_,[]).
subsecuencia([X|Xs],[X|Ys]):- subsecuencia(Xs,Ys).
subsecuencia([X|Xs],[Y|Ys]):- subsecuencia(Xs,[Y|Ys]).
