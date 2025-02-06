estrada(a,d,23).
estrada(a,b,25).
estrada(b,e,32).
estrada(e,f,26).
estrada(b,c,19).
estrada(c,f,28).
estrada(c,d,14).
estrada(d,f,30).

dist(A,A,0).

dist(A,B,D) :- estrada(A,B,D).

dist(A,B,D) :-
estrada(A,X,Dist1),
estrada(X,B,Dist2),
D is Dist1 + Dist2.
