matriz(Matriz):- Matriz =  [[1, 2, 3], [1, 3, 5], [4, 4, 4]].

elemento([X|_], posicion(1,Columna),Elemento):- posicion(X,Columna,Elemento).
elemento([X|Xs], posicion(Fila,Columna),Elemento):- Fila2 is Fila - 1, elemento(Xs, posicion(Fila2,Columna),Elemento). 

posicion([X|_],1,X):- !.
posicion([X|Xs],Indice,Elemento):- Indice2 is Indice - 1, posicion(Xs,Indice2,Elemento).

actualiza([X|Xs],posicion(1,Columna),Elemento,[R|Xs]):- modifica(X,Columna,Elemento,R).
actualiza([X|Xs],posicion(Fila,Columna), Elemento, [X|Resultado]):- Fila2 is Fila - 1, actualiza(Xs,posicion(Fila2,Columna),Elemento,Resultado).

modifica([X|Xs],1,Elemento,[Elemento|Xs]). 
modifica([X|Xs],Indice,Elemento,[X|Ys]):- Indice2 is Indice - 1 , modifica(Xs,Indice2,Elemento,Ys).

transpone([[],[],[],[]]).
transpone(Matriz,[R|R3]):- tomarPrimerElemento(Matriz,R), eliminarPrimerElemento(Matriz,R2), transpone(R2,R3).

sumaMatrices([], [], []):- !.
sumaMatrices([X|Xs], [Y|Ys], [mat|Zs]):- sumarVectores(X,Y,Z), sumaMatrices(Xs,Ys,Zs).

sumarVectores([], [], []).
sumarVectores([X|Xs],[Y|Ys],[Z|Zs]):- Z is X + Y, sumarVectores(Xs,Ys,Zs).

eliminarPrimerElemento([],[]).
eliminarPrimerElemento([X|Xs],[R|Rs]):- eliminarPosicion(X,1,R), eliminarPrimerElemento(Xs,Rs).

eliminarPosicion([X|Xs],1,Xs).
eliminarPosicion([X|Xs],Posicion,[X|R]):- Posicion2 is Posicion - 1 , eliminarPosicion(Xs,Posicion2,R).

tomarPrimerElemento([],[]).
tomarPrimerElemento([X|Xs],[R|Rs]):- posicion(X,1,R), tomarPrimerElemento(Xs,Rs).
% Sume las dos diagonales de dos matrices diferentes, era sumar la diagonal principal y secundaria pero bue, casi.
sumarDiagonales([X|Xs],Matriz2,Matriz3):-longitud(X,Long), sumaMatrices(Matriz1,Matriz2,R), obtenerDiagonal(R,Resultado,Long,[1,1]).
obtenerDiagonal(Matriz,[],Long,[Fila,Columna]):- Fila > Long.
obtenerDiagonal(Matriz,[R|Rs],Long,[Fila,Columna]):- Fila =< Long, elemento(Matriz,posicion(Fila,Columna),R),Fila2 is Fila + 1, Columna2 is Columna + 1,obtenerDiagonal(Matriz,Rs,Long,[Fila2,Columna2]).
longitud([_],1):- !.
longitud([_|Xs],N):- longitud(Xs,P) ,N is 1+P.