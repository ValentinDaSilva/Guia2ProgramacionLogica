identifica([X,Y|Zs],S):- X < Y, maximo([X,Y|Zs],S).
identifica([X,Y|Zs],S):- X > Y, minimo([X,Y|Zs],S).
maximo([X,Y|Zs],S):- X < Y, maximo([Y|Zs],S).
maximo([X,Y|Zs],S):- X > Y, maximoMinimo([Y|Zs],S).
maximo([X,Y|Zs],S):- X = Y, maximoMeseta([X,Y|Zs],S).
maximoMeseta([X,Y,Z|Zs],S):- X = Y, X = Z, mesetaMinimo([Z|Zs],S).
maximoMeseta([X,Y,Z|_],S):- X = Y, X \= Z, fail(S).
mesetaMinimo([_],"Meseta"):-!.
mesetaMinimo([X,Y|Zs],S):- X > Y, mesetaMinimo([Y|Zs],S).
mesetaMinimo([X,Y|_],S):- X < Y, fail(S).
maximoMinimo([_],"Maximo"):-!.
maximoMinimo([X,Y|Zs],S):- X > Y, maximoMinimo([Y|Zs],S).
maximoMinimo([X,Y|_],S):- X < Y, fail(S).
minimo([X,Y|Zs],S):- X > Y, minimo([Y|Zs],S).
minimo([X,Y|Zs],S):- X < Y, minimoMaximo([Y|Zs],S).
minimoMaximo([_],"Minimo"):-!.
minimoMaximo([X,Y|Zs],S):- X < Y, minimoMaximo([Y|Zs],S).
minimoMaximo([X,Y|_],S):- X > Y, fail(S).
fail("SinOrden").

