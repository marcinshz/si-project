member1(Head, [Head|Tail]).
member1(X, [Head|Tail]) :- member1(X,Tail).

concat1([], L2, L2).
concat1([Head|Tail], L2, [Head|L3]) :- concat1(Tail, L2, L3).

delete1(Head, [Head|Tail], Tail).
delete1(X, [Y|Tail], [Y|L1]) :- delete1(X, Tail, L1).

sum([], 0).
sum([Head|Tail], Sum) :- sum(Tail, TailSum), Sum is Head + TailSum.

avg([],0).
avg(List, Average) :- sum(List, Sum), length(List, Length), Length > 0, Average is Sum / Length.

count(_, [], 0).
count(X, [X], 1).
count(X, [X|Tail], N) :- count(X, Tail, P), N is P + 1.
count(X, [Head|Tail], N) :- dif(X, Head), count(X, Tail, N).

len([], 0).
len([_|Tail], N) :- len(Tail, M), N is M + 1.

double([], []).
double([X|Xs], [X, X|Ys]) :- double(Xs, Ys).

repeat1([],[],_).
repeat1([X|Xs],Y,N) :-  
    count(X,Y,N),
    len(Head, N),
    append(Head, Tail, Y),
    repeat1(Xs,Tail,N).
