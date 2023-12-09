sum([],0).
sum([Head|Tail],W) :- sum(Head,Z), sum(Tail,Y), W is Y+Z.
sum(Head,X) :- X is Head.

avg([],0).
avg(List,W) :- sum(List,X), length(List,Y), W is X/Y.

count(_, [], 0).
count(X, [X], 1).
count(X, [X|Tail], N) :- count(X, Tail, P), N is P + 1.
count(X, [Head|Tail], N) :- dif(X, Head), count(X, Tail, N).

len([], 0).
len([_|Tail], N) :- len(Tail, M), N is M + 1.

double([], []).
double([X|Xs], [X, X|Ys]) :- double(Xs, Ys).
