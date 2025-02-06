%Questao 01)
%Crie uma base de dados de livros em Prolog, onde cada livro deve conter 
%informações sobre o autor principal, título e ano de publicação. Elabore as seguintes consultas: 
% 
%Quais os livros de um determinado autor? 
%Quais os livros escritos nos anos 1997 e 1998?

livro('anne frank', o_diario_de_anne_frank, 1944).
livro('charles duhigg', o_poder_do_habito, 2012).
livro('charles duhigg', mais_rapido_e_melhor, 2016).
livro('agatha christie', o_assasinato_no_expresso_oriente, 1934).
livro('agatha christie', o_misterioso_caso_de_styles, 1920).
livro('agatha christie', they_do_it_with_mirros, 1952).
livro('agatha christie', os_cinco_porquinhos, 1942).
livro('agatha christie', noite_sem_fim, 1967).

livros_autor(Livro, Autor) :- livro(Autor,Livro,_).
livros_anos97e98(Livro) :- livro(_,Livro,1997) ; livro(_,Livro,1998).

%Questao 03)
%
%Escreva os seguintes predicados utilizando os operadores aritméticos e de comparação.
% 3. numero_natural(X) X é um número natural 
% 4. numero_par(X) X é um número natural par 
% 5. numero_impar(X) é um número natural ímpar 
% 6. soma(X,Y,Z) Z é a soma dos números naturais X e Y 
% 7. fatorial(X,F)  O fatorial de X é F 
% 8. minimo(N1,N2,Min) O mínimo de N1 e N2 é Min 
% 9. mod(X,Y,Z) Z é o resto da divisão inteira de X por Y 

numero_natural(X) :- X >= 0, integer(X).
numero_par(X) :- X mod 2 =:= 0.
numero_impar(X) :- X mod 2 =:= 1.
soma(X,Y,Z) :- numero_natural(X), numero_natural(Y),
Z is X + Y.
fatorial(0,1).
fatorial(X,F) :- 
X > 0,
X1 is X - 1, fatorial(X1,F1),
F is X * F1.
minimo(N1,N2,Min) :- 
N2 =< N1,
Min is N2.
minimo(N1,N2,Min) :-
N1 < N2,
Min is N1.
mod(X,Y,Z) :- 
Y > 0,
Z is X mod Y.

%
%LISTAS
%

%10) list(L)
list([]).
list([_|_]).

%11) member(X,L)
member(E,[E|_]).
member(E,[H|T]) :-
member(E,T).

%12) not_member(X, L)
not_member(X,L) :- not(member(X,L)).

%15) sublist(Sub,List)
sublist([],_).
sublist([H|T],L) :-
member(H,L),
sublist(T,L).

%16) append(L1,L2,List)
append([],[],[]).
append([], L2, L2).
append([X|L1], L2, [X|L]) :-
append(L1, L2, L).

%17) reverse(List,Rev)
reverse([],[]).
reverse([H|T],R) :-
reverse(T,L),
append(L,[H],R).