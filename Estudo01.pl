grande(urso).
grande(elefante).
pequeno(gato).
marrom(urso).
preto(gato).
cinza(elefante).
escuro(Z) :- preto(Z).
escuro(Z) :- marrom(Z).

a(a,e).
a(a,b).
a(b,c).
a(b,f).
a(f,c).
a(e,f).
a(e,d).
a(g,h).
a(g,d).
a(h,f).

path(X,X).
path(X,Y) :- a(X,Z), path(Z,Y).

somalista([],0).
somalista([H|T],Soma) :- somalista(T,SomaT), 
Soma is H+SomaT.