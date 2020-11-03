% working
incr(null, f1(null)).
incr(f0(X), f1(X)).
incr(f1(X), f0(Y)) :- incr(X, Y).
% can't get to work
legal(f0(null)).
legal(X) :- incr(Y, X), legal(Y).
% not working
incrR(X, Y) :-  legal(X), incr(X, Y).
% working
add(f0(null), X, X).
add(X, Y, Z) :- incr(X1, X), incr(Y, Y1), add(X1, Y1, Z).
% working
mult(X, Y, Z) :- multEXT(X, Y, Z, f0(null)).
multEXT(f0(null), _, Z, Z).
multEXT(X, Y, Z, A) :- incr(X1, X), add(Y, A, A1), multEXT(X1, Y, Z, A1).
% working
revers(A, B) :- reversACC(A, null, B).
reversACC(null, X, X).
reversACC(f0(X), A, R) :- reversACC(X, f0(A), R).
reversACC(f1(X), A, R) :- reversACC(X, f1(A), R).
% kinda working
normalize(null, f0(null)).
normalize(f0(null), f0(null)).
normalize(X, Y) :- revers(X, A), normrevers(A, B), revers(B, Y).
normrevers(null, f0(null)).
normrevers(f1(X), f1(X)).
normrevers(f0(X), Y) :- normrevers(X, Y)
% TESTING
% test add inputting numbers N1 and N2
testAdd(N1,N2,T1,T2,Sum,SumT) :- numb2pterm(N1,T1), numb2pterm(N2,T2),
add(T1,T2,SumT), pterm2numb(SumT,Sum).
% test mult inputting numbers N1 and N2
testMult(N1,N2,T1,T2,N1N2,T1T2) :- numb2pterm(N1,T1), numb2pterm(N2,T2),
mult(T1,T2,T1T2), pterm2numb(T1T2,N1N2).
% test revers inputting list L
testRev(L,Lr,T,Tr) :- ptermlist(T,L), revers(T,Tr), ptermlist(Tr,Lr).
% test normalize inputting list L
testNorm(L,T,Tn,Ln) :- ptermlist(T,L), normalize(T,Tn), ptermlist(Tn,Ln).
% make a pterm T from a number N numb2term(+N,?T)
numb2pterm(0,f0(null)).
numb2pterm(N,T) :- N>0, M is N-1, numb2pterm(M,Temp), incr(Temp,T).
% make a number N from a pterm T pterm2numb(+T,?N)
pterm2numb(null,0).
pterm2numb(f0(X),N) :- pterm2numb(X,M), N is 2*M.
pterm2numb(f1(X),N) :- pterm2numb(X,M), N is 2*M +1.
% reversible ptermlist(T,L)
ptermlist(null,[]).
ptermlist(f0(X),[0|L]) :- ptermlist(X,L).
ptermlist(f1(X),[1|L]) :- ptermlist(X,L).