%mergesort algorythm implementation
mergeSort([],[]).
mergeSort([E],[E]).
mergeSort(Lista, ListaOrdenada) :- separate(Lista,Ll,Lr), mergeSort(Lr, LrF), mergeSort(Ll,LlF),join(LlF, LrF, ListaOrdenada),!.
separate([],[],[]).
separate([E],[E],[]).
separate([C,E|R],[C|L1],[E|L2]):- separate(R,L1,L2).
join(L,[],L).
join([],L,L).
join([C1|R1],[C2|R2] ,[C1|Lf]) :- C1 =< C2, join(R1,[C2|R2],Lf).
join(L,[C2|R2] ,[C2|Lf]) :- join(R2,L,Lf).
