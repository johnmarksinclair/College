
incr(null, f1(null)).
incr(f0(X), f1(X)).
incr(f1(X), f0(Y)) :- incr(X, Y).

legal(f0(null)).
legal(X) :- legal(Y), incr(Y, X).