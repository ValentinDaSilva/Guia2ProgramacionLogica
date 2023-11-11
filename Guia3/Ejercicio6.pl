% libro(titulo,editorial,autor)
libro(titulo("The Art of Prolog"), editorial("The MIT Press"), autor([sterling, shapiro])).
libro(titulo("The Unified Software Development Process"), editorial("Addison-Wesley"),autor([jacobson, booch, rumbaugh])).
libro(titulo("Logic for Problem Solving"), editorial("Prentice Hall"),autor([kowalski])).
% edicion(titulo,numero,isbn,idioma)
edicion(titulo("Logic for Problem Solving"), numero(1), isbn(978-0444003683), idioma("ingles")).
edicion(titulo("The Art of Prolog"), numero(2),isbn(978-0262193382), idioma("ingles")).
edicion(titulo("Logic for Problem Solving"), numero(2),isbn(978-3837036299), idioma("ingles")).
edicion(titulo("The Unified Software Development Process"), numero(1),isbn(978-8478290369), idioma("español")).
edicion(titulo("The Art of Prolog"), numero(1),isbn(978-2225819483), idioma("frances")).
edicion(titulo("The Unified Software Development Process"), numero(1),isbn(978-0201571691), idioma("ingles")).
% impreso(isbn,pags,precio,anio).
impreso(isbn(978-0262193382), pag(560), precio(65), anio(1994)).
impreso(isbn(978-0201571691), pag(472), precio(56), anio(2000)).
impreso(isbn(978-3837036299), pag(346), precio(64), anio(2014)).
impreso(isbn(978-2225819483), pag(505), precio(30), anio(1997)).
impreso(isbn(978-8478290369), pag(472), precio(25), anio(2000)).
% reglas
edicionImpresa(Titulo, Idioma, Anio):- edicion(titulo(Titulo),numero(_),isbn(Isbn),idioma(Idioma)),impreso(isbn(Isbn), pag(_), precio(_), anio(Anio)).
cantidadAutores(Titulo, Cantidad):- libro(titulo(Titulo), editorial(_), autor(Autores)), longitud_lista(Autores,Cantidad).
listaEditoriales(L):- listaEditorialesAux(L,[]).
listaEditorialesAux([X|L],Aux):- libro(titulo(_), editorial(X), autor(_)), not(miembro(X,Aux)), ! , append(Aux,[X],Aux2), listaEditorialesAux(L,Aux2).
listaEditorialesAux([],_).
precioLibro(Libro,[Libro,Precio]):- edicion(titulo(Libro), numero(_), isbn(Isbn), idioma(_)),impreso(isbn(Isbn), pag(_), precio(Precio), anio(_)).
listaLibroPrecio(L):- listaLibroPrecioAux(L,[]).
listaLibroPrecioAux([Y|L],Aux):-  precioLibro(X,Y), not(miembro_lista(Y,Aux)), ! , append(Aux,[Y],Aux2), listaLibroPrecioAux(L,Aux2).
listaLibroPrecioAux([],_). 
buscarMayorPrecio([],LibroFinal,PrecioFinal,PrecioFinal,LibroFinal).
buscarMayorPrecio([X|Xs],LibroFinal,PrecioFinal, PrecioActual, LibroActual):- posicion(X,2,R), R >= PrecioActual, posicion(X,1,R2) ,buscarMayorPrecio(Xs,LibroFinal,PrecioFinal, R, R2).
buscarMayorPrecio([X|Xs],LibroFinal,PrecioFinal, PrecioActual, LibroActual):- posicion(X,2,R),R < PrecioActual, buscarMayorPrecio(Xs,LibroFinal,PrecioFinal, PrecioActual, LibroActual).
precioMaximo(Titulo):- listaLibroPrecio(L),buscarMayorPrecio(L,Titulo,Y,0,"").
% Clausulas de calculo
longitud_lista([_],1).
longitud_lista([_|Xs],Longitud):- longitud_lista(Xs,R), Longitud is R + 1. 
miembro(X,[X|_]):- !.
miembro(X,[_|Ys]):- miembro(X,Ys). 
miembro_lista(X, [Y|Ys]):- X = Y. 
miembro_lista(X, [Y|Ys]):- miembro_lista(X,Ys). 
posicion([X|Xs],Posicion,Resultado):- posicionAux([X|Xs],Posicion,Posicion,Resultado).
posicionAux([X|_],_,1,X).
posicionAux([X|Xs],Posicion,Indice,Resultado):- Indice2 is Indice-1, posicionAux(Xs,Posicion,Indice2,Resultado).