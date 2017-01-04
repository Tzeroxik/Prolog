%********************List and tree structure predicates******************%

% isList(?X) - succeeds if "X" is a list.
isList([]).
isList([_|Tail]) :- isList(Tail).

% existsInList(+Element, +List) - succeeds if an element exists in a list.
existsInList(Head,[Head|_]) :- !.
existsInList(Element,[_|Tail]) :- existsInList(Element,Tail).
