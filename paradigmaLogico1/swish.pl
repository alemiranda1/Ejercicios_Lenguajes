/******************************************************************************
 * REPOSITORIO LENGUAJES IS 2024
 * Paradigma Lógico 1
 * Alejandro Miranda González
 *****************************************************************************/


%*****************************************************************************
% Ejercicio 1
% Ejemplo de corrida: sub_conjunto([1,2,3],[1,2,3,4,5]).
sub_conjunto([], _).
sub_conjunto([H|T], Set) :-
    member(H, Set),
    sub_conjunto(T, Set).


%*****************************************************************************
% Ejercicio 2
% Ejemplo de corrida: aplanar([1,2,[3,[4,5],[6,7]]],X).
aplanar([], []).
aplanar([H|T], Plana) :-
    is_list(H),
    aplanar(H, PlanaH),
    aplanar(T, PlanaT),
    append(PlanaH, PlanaT, Plana).
aplanar([H|T], [H|PlanaT]) :-
    \+ is_list(H),
    aplanar(T, PlanaT).


%*****************************************************************************
% Ejercicio 3
% Ejemplo de corrida: distancia("romano", "comino", X).
distancia(Cadena1, Cadena2, Distancia) :-
	string_codes(Cadena1, Codes1),
	string_codes(Cadena2, Codes2),
	foldl([A, B, S, R] >> (A =:= B -> R is S ; R is S + 1), Codes1, Codes2, 0, Distancia).


%*****************************************************************************
% Ejercicio 4
% Ejemplo de corrida: maximo(X, Y, Z, 650).
/*entradas*/
entradas(guacamole).
entradas(ensalada).
entradas(consome).
entradas(tostadas_caprese).

/*plato principal*/
carne(filete_de_cerdo).
carne(pollo_al_horno).
carne(carne_en_salsa).
pescado(tilapia).
pescado(salmon).
pescado(trucha).

/*postre*/
postre(flan).
postre(nueces_con_miel).
postre(naranja_confitada).
postre(flan_de_coco).

/*calorias de cada uno*/
calorias(guacamole, 200).
calorias(ensalada, 150).
calorias(consome, 300).
calorias(tostadas_caprese, 250).
calorias(filete_de_cerdo, 400).
calorias(pollo_al_horno, 280).
calorias(carne_en_salsa, 320).
calorias(tilapia, 160).
calorias(salmon, 300).
calorias(trucha, 225).
calorias(flan, 200).
calorias(nueces_con_miel, 500).
calorias(naranja_confitada, 450).
calorias(flan_de_coco, 375).

principal(X):- carne(X).
principal(X):- pescado(X).

completa(Entrada, Principal, Postre):- entradas(Entrada), principal(Principal), postre(Postre).

/*regla para sumar las calorias de cada racion en la comida completa*/
valor_calorico(X, Y, Z, V):- calorias(X, VE), calorias(Y, VP), calorias(Z, VPo), V is VE+VP+VPo, completa(X, Y, Z).

/*regla para obtener las comidas que no superen el maximo de calorias especificado*/
maximo(X, Y, Z, Max):- completa(X, Y, Z), valor_calorico(X, Y, Z, VC), VC =< Max.

