isnumber(zero).
isnumber(s(X)) :- isnumber(X).

odd(s(zero)).
odd(s(s(X))) :- odd(X).

even(zero).
even(s(s(X))) :- even(X).

add(zero,X,X) :- isnumber(X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).

times(zero, X, zero) :- isnumber(X).
times(s(X),Y,Z) :- times(X, Y, Q), add(Y,Q,Z).

quotient(_, zero, _) :- !, fail.
quotient(zero,zero, zero) :- false.
quotient(X,Y,Z) :- times(Z,Y,X).

lessthanequal(zero,X) :- isnumber(X).
lessthanequal(s(X),s(Y)) :- lessthanequal(X,Y).

remainder(X,Y,X) :- lessthanequal(X,Y).
remainder(X,Y,R) :- add(Z,Y,X), remainder(Z,Y,R).

fact(zero, s(zero)) :- true.
fact(s(zero), s(zero)) :- true.
fact(s(X), Y) :- fact(X, Z), times(Z,s(X),Y).

fibonacci(zero, zero) :- true.
fibonacci(s(zero), s(zero)) :- true.
fibonacci(s(s(X)), Y) :- fibonacci(X,A), fibonacci(s(X),B), add(A,B,Y).

shownum(zero,0).
shownum(s(X),Y):-shownum(X,Q), Y is Q + 1.
