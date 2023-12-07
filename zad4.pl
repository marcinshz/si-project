sum([],0).
sum([Head|Tail],W) :- sum(Head,Z), sum(Tail,Y), W is Y+Z.
sum(Head,X) :- X is Head.

avg([],0).
avg(List,W) :- sum(List,X), length(List,Y), W is X/Y.

count(X,[],0).
count(X,X,1).
count(X,[X],1).
count(X,[Head|Tail],N) :- count(X,Tail,P), count(X,Head,W), N is P+W.
