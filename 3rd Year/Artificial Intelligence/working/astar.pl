% given code modified

arc([H|T],Node,Cost,KB) :- 
    member([H|B],KB),
    append(B,T,Node),
    length(B,L),
    Cost is 1+ L/(L+1).

heuristic(Node,H) :- length(Node,H).

goal([]). 

less-than([_,[Node1|_],Cost1],[_,[Node2|_],Cost2]) :- 
    heuristic(Node1,Hvalue1),
    heuristic(Node2,Hvalue2),
    F1 is Cost1+Hvalue1,
    F2 is Cost2+Hvalue2,
    F1 =< F2.

% implementatino of a* algo

astar(Node,Path,Cost,KB) :- search([[Node,[],0]],PathReverse,Cost,KB), reverse(Path, PathReverse).

search([[Node, Path, Cost]|_], [Node|Path], Cost, _) :- goal(Node).
search([[Node, CurrentPath, CurrentCost]|Tail], Path, Cost, KB) :-
    findall([X,[Node|CurrentPath],PathCost],(arc(Node,X,ArcCost,KB),PathCost is ArcCost + CurrentCost),Children),
    add2frontier(Tail,Children,NewFrontier),
    insertSort(NewFrontier, SortedFrontier),
    search(SortedFrontier,Path,Cost,KB).

add2frontier(Children,[],Children).
add2frontier(Children,[Head|Tail],[Head|More]) :- add2frontier(Children,Tail,More).

insertSort([],[]) :- !.
insertSort([Head|Tail],Sorted) :- insertSort(Tail,Sorted1), insert(Head,Sorted1,Sorted).

insert(X,[],[X]) :-!.
insert(X, [X1|L1], [X, X1|L1]):- less-than(X,X1), !.
insert(X, [X1|L1], [X1|L]):- insert(X, L1, L).