arbol(Raiz,nil,nil):- integer(Raiz).
arbol(Raiz,nil,Der):- integer(Raiz),arbol_binario(Der).
arbol(Raiz,Izq,nil):- integer(Raiz),arbol_binario(Izq).
arbol_binario(nil).
arbol_binario(arbol(Raiz,Izq,Der)):- integer(Raiz),arbol_binario(Izq),arbol_binario(Der).
miembro_arbol(Valor,arbol(Valor,_,_)).
miembro_arbol(Valor,arbol(Raiz,Izq,Der)):- miembro_arbol(Valor,Izq).
miembro_arbol(Valor,arbol(Raiz,Izq,Der)):- miembro_arbol(Valor,Der).
listar_hojas(arbol(Raiz,nil,nil),[Raiz]).
listar_hojas(arbol(Raiz,Der,nil),X):- listar_hojas(Der,X).
listar_hojas(arbol(Raiz,nil,Izq),X):- listar_hojas(Izq,X).
listar_hojas(arbol(_,Izq,Der),X):- listar_hojas(Izq,X1),listar_hojas(Der,X2),append(X1,X2,X).
preorden(arbol(Raiz,nil,nil),[Raiz]).
preorden(arbol(Raiz,Der,nil),[Raiz|Resto]):- preorden(Der,Resto).
preorden(arbol(Raiz,nil,Izq),[Raiz|Resto]):- preorden(Izq,Resto).
preorden(arbol(Raiz,Izq,Der),[Raiz|Resto]):- preorden(Izq,Resto1), preorden(Der,Resto2),append(Resto1,Resto2,Resto).
inorden(arbol(Raiz,nil,nil),[Raiz]).
inorden(arbol(Raiz,Der,nil),Lista):-inorden(Der,Lista1),append(Lista1,[Raiz],Lista).
inorden(arbol(Raiz,nil,Izq),Lista):-inorden(Izq,Lista1),append([Raiz],Lista1,Lista). 
inorden(arbol(Raiz,Izq,Der),Lista):- inorden(Izq,Lista1),append(Lista1,[Raiz],Lista2), inorden(Der,Lista3), append(Lista2,Lista3,Lista).
postorden(arbol(Raiz,nil,nil),[Raiz]).
postorden(arbol(Raiz,Der,nil),Lista):-postorden(Der,Lista1),append(Lista1,[Raiz],Lista).
postorden(arbol(Raiz,nil,Izq),Lista):-postorden(Izq,Lista1),append(Lista1,[Raiz],Lista).
postorden(arbol(Raiz,Izq,Der),Lista):- postorden(Izq,Lista1),postorden(Der,Lista2),append(Lista1,Lista2,Lista3),append(Lista3,[Raiz],Lista).