parent(able,adam).
parent(able,eve).
parent(cain,adam).
parent(cain,eve).
parent(eve,bob).
parent(eve,john).
parent(john,kon).

unify(X,X).

reverse(L,nil,L).
reverse(R,l(X,Xs),L):-reverse(R,Xs,l(X,L)).
reverse(R,Xs(X),L):-reverse(R,Xs,L(X)).

closure(R)(X,Y) :- R(X,Y).
closure(R)(X,Y) :- R(X,Z), closure(R)(Z,Y).

map(F)(nil,nil).
map(F)(l(X,Xs),l(Y,Ys)) :- F(X,Y), map(F)(Xs,Ys).

foldr(F,Z,F2,I2)(Z,I2).
foldr(F,Z,F2,I2)(F(X,Fr),F2(X,Xs)):-foldr(F,Z,F2,I2)(Fr,Xs).

fold(X,Y):-foldr(l,nil,add,zero)(X,Y).

list(nil,nil).
list(l(X,Xs),Xss(X)):-list(Xs,Xss).

not(X):-X,!,fail.
not(X).
