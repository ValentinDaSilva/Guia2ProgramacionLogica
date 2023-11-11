max(X,Y,X):- X >= Y.
max(X,Y,Y):- X < Y.
profundidad(arbol(_,nil,nil),0).
profundidad(nil,0).
profundidad(arbol(_,Izq,nil),X):- Izq\=nil,profundidad(Izq,X1), X is X1+1.
profundidad(arbol(_,nil,Der),X):- Der\=nil,profundidad(Der,X1), X is X1+1.
profundidad(arbol(_,Izq,Der),X):- Izq\=nil,Der\=nil, profundidad(Izq,X1),profundidad(Der,X2),max(X1,X2,X3),X is X3+1.
suma_nodos(arbol(Raiz,nil,nil),Raiz).
suma_nodos(arbol(Raiz,Izq,nil),X):- Izq\=nil, suma_nodos(Izq,X1), X is Raiz+X1.
suma_nodos(arbol(Raiz,nil,Der),X):- Der\=nil, suma_nodos(Der,X1), X is Raiz+X1.
suma_nodos(arbol(Raiz,Izq,Der),X):- suma_nodos(Izq,X1),suma_nodos(Der,X2),X is X1+X2+Raiz.
cantidad_hojas(arbol(_,nil,nil), 1).
cantidad_hojas(arbol(_,Izq,nil), X):- Izq\=nil, cantidad_hojas(Izq,X).
cantidad_hojas(arbol(_,nil,Der), X):- Der\=nil, cantidad_hojas(Der,X).
cantidad_hojas(arbol(_,Izq,Der), X):- cantidad_hojas(Izq, X1),cantidad_hojas(Der, X2), X is X1+X2.

