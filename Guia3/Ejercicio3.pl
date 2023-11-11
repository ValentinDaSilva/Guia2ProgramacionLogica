sust([], _, _, []).
sust([X|Xs], [Y|Ys], O, [X|Ws]):- X\=Y, sust(Xs, [Y|Ys], O, Ws).
sust([X|Xs], [Y|Ys], O, Ws):- X==Y, todo_el_patron_esta([X|Xs],[Y|Ys]),eliminar_patron([X|Xs],[Y|Ys],Resto),append(O,Zs,Ws),sust(Resto,[Y|Ys], O,Zs).
sust([X|Xs], [Y|Ys], O, [X|Ws]):- X==Y, not(todo_el_patron_esta([X|Xs],[Y|Ys])),sust(Xs, [Y|Ys], [Z|Zs], Ws).
todo_el_patron_esta(_,[]).
todo_el_patron_esta([X|Xs],[Y|Ys]):- X==Y, todo_el_patron_esta(Xs,Ys).
eliminar_patron(X,[],X). 
eliminar_patron([X|Xs],[Y|Ys],R):- X==Y,eliminar_patron(Xs,Ys,R).
