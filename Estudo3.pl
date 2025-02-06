fatorial(0,1).
fatorial(X,Y) :-
X > 0,
X1 is X - 1,
fatorial(X1,Y1),
Y is X * Y1.

max(X,Y,X) :- X >= Y.
max(X,Y,Y) :- Y > X.

soma(0,0).
soma(N,T) :-
N > 0,
N1 is N - 1,
soma(N1, T1),
T is N + T1.

expo(_,0,1).
expo(N,E,R) :-
E1 is E - 1,
expo(N,E1,R1),
R is N * R1.