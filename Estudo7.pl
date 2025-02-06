conexao(0,1).
conexao(0,4).
conexao(4,3).
conexao(1,2).
conexao(2,3).
conexao(3,1).
conexao(3,4).

caminho(X,X,_,[X]).
caminho(X,Y,V,[X|C]) :-
conexao(X,T),
not(member(T,V)),
caminho(T,Y,[X|V],C).