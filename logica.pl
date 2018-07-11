ordenada([]):- true.

ordenada([_]):- true.

ordenada([H,H2|T]):-
    H =< H2,
    ordenada([H2|T]).
    
quitaRepetidos([],[]):-!. 
quitaRepetidos([X],[X]):-!.
quitaRepetidos([H,H2|T],[H|R]):-
    H \= H2,
    quitaRepetidos([H2|T],R).
quitaRepetidos([H,H2|T],R):-
    H == H2,
    quitaRepetidos([H2|T],R).