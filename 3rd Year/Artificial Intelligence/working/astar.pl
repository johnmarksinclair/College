% given code - with edits
arc([H|T], Node, Cost, KB) :- 
    member([H|B], KB),
    append(B, T, Node),
    length(B, L),
    Cost is 1+ L/(L+1).

heuristic(Node, H) :- length(Node, H).

goal([]). 

less-than([_, [Node1|_], Cost1], [_, [Node2|_], Cost2]) :- 
    heuristic(Node1, Hvalue1),
    heuristic(Node2, Hvalue2),
    F1 is Cost1+Hvalue1,
    F2 is Cost2+Hvalue2,
    F1 =< F2.

% implementatino of a* algo
astar(Node, Path, Cost, KB) :- search([[Node, [], 0]], ReversedPath, Cost, KB), reverse(Path, ReversedPath).

search([[Node, Path, Cost]|_], [Node|Path], Cost, _) :- goal(Node).
search([[Node, CurrentPath, RollingCost]|Tail], Path, Cost, KB) :-
    findall([X, [Node|CurrentPath], TotalCost], (arc(Node, X, CostOfArc, KB), TotalCost is CostOfArc + RollingCost), Children),
    add2frontier(Tail, Children, Frontier),
    insertSort(Frontier, SortedFrontier),
    search(SortedFrontier, Path, Cost, KB).

add2frontier(Children, [], Children).
add2frontier(Children, [Head|Tail], [Head|More]) :- add2frontier(Children, Tail, More).
% insertion sort method
insertSort([], []) :- !.
insertSort([Head|Tail], Sorted) :- insertSort(Tail, Other), insert(Head, Other, Sorted).
% insert function used in insertion sort
insert(X, [], [X]) :-!.
insert(X, [X1|L1], [X, X1|L1]):- less-than(X, X1), !.
insert(X, [X1|L1], [X1|L]):- insert(X, L1, L).

% test queries
% astar([q],Path,Cost,[[q,a],[q,b,c],[a,d,e],[a,c,e,f],[b,c],[c,e,f],[e],[f,e]]).
% [[q], [a], [c, e, f], [e, f, e, f], [f, e, f], [e, e, f], [e, f], [f], [...]|...], 11.916
% [[q], [b, c], [c, c], [e, f, c], [f, c], [e, c], [c], [e|...], [...]|...], 13.499
% false
% astar([q],Path,Cost,[[q,a],[q,b,c],[a],[b],[c]]).
% [[q], [a], []], 2.5
% [[q], [b, c], [c], []], 3.666
% false