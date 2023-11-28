% Laby
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).
parent(joe, jim).

male(tom).
male(bob).
male(jim).
male(joe).
female(pat).
female(pam).
female(liz).
female(ann).

mother(X, Y) :- parent(X, Y), female(X).
father(X, Y) :- parent(X, Y), male(X).

child(X, Y) :- parent(Y, X).

grandparent(X, Y, Z) :- parent(Y, X), parent(Z, Y).

greatgrandparent(X, Y, Z, T) :- parent(Y, X), parent(Z, Y), parent(T, Z).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- ancestor(X, Z), parent(Z, Y).

partner(X, Y, Z) :- parent(X, Z), parent(Y, Z), not(X = Y).

% Projekt
% Predykat 1
son(X, Y) :- male(X), child(X, Y).

% Predykat 2
granddaughter(X, Y) :- female(X), grandparent(X, _, Y).

% Predykat 3
partner(X,Y) :- parent(X,Z), parent(Y,Z), not(X = Y).

% Predykat 4
sibling(X, Y) :- parent(Z, X), parent(Z, Y), not(X = Y).
aunt(X, Y) :- parent(Z, Y), sibling(X, Z), female(X).
