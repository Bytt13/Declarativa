conc(L1,L2,L3).
conc([],L,L).
conc([X|L1], L2, [X,L3]) :- conc(L1,L2,L3).

ordenar([],[]).
ordenar([H|T],LO) :- ordenar(T,TO),
inserir(H,TO,LO).

inserir(E,[],[E]).
inserir(E,[H|T],[H|L]) :-
E >= H, inserir(E,T,L).
inserir(E,[H|T],[E,H|T]) :- E < H.