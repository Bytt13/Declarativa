enesimo(1,X,[X|Y]).
enesimo(N,X,[H|T]) :-
N1 is N - 1,
enesimo(N1,X,T).

