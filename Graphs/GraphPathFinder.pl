point(a).
point(b).
point(c).
point(d).
point(e).
point(f).
point(g).
point(h).
point(i).
connection(a,b,22).
connection(a,c,9).
connection(a,d,12).
connection(b,a,22).
connection(b,c,35).
connection(b,f,36).
connection(b,h,34).
connection(c,a,9).
connection(c,b,35).
connection(c,d,4).
connection(c,f,42).
connection(c,e,65).
connection(d,a,12).
connection(d,c,4).
connection(d,e,33).
connection(d,i,30).
connection(e,c,65).
connection(e,d,33).
connection(e,f,18).
connection(e,g,23).
connection(f,b,36).
connection(f,c,42).
connection(f,g,39).
connection(f,h,24).
connection(g,e,23).
connection(g,f,39).
connection(g,h,25).
connection(g,i,21).
connection(h,b,34).
connection(h,f,24).
connection(h,g,25).
connection(h,i,19).
connection(i,d,30).
connection(i,g,21).
connection(i,h,19).

%for future file reading graphs
%addPoint(P):- \+point(P),asserta(point(P)).
%addconnection(P,P,0).
%addconnection(P1,P2,D):- \+connection(P1,P2,_),\+connection(P2,P1,_),asserta(connection(P1,P2,D)),asserta(connection(P2,P1,D)).

solvePath(X,Y,G,W):-findGoal(X,Y,[X],L),reverse(L,G),pathWeight(X,G,0,W),!.
findGoal(P,P,Visited,Visited):-!.
findGoal(CurrPoint,FPoint,Visited,Path) :- findNext(CurrPoint,FPoint,Visited,Next),
	findGoal(Next,FPoint,[Next|Visited],Path).    
findNext(CurrPoint,FinalPoint,PastPoints,Next):- findall(CurrPoint/Point/Dist,connection(CurrPoint,Point,Dist),LP),
    sortByDist(LP,OLP), choosePoint(OLP,FinalPoint,PastPoints,Next).

%se for o ponto final ir para esse.
%se for um ponto nao visitado
%tentar o proximo
%caso não dê voltar para trás

choosePoint([_/FinalPoint/_|_],FinalPoint,_,FinalPoint).
choosePoint([_/Point/_|_],_,Visited,Point):- \+member(Point,Visited).
choosePoint([],_,[LastP|_],LastP).
choosePoint([_|R],FinalPoint,Visited,Point):-
    choosePoint(R,FinalPoint,Visited,Point).

pathWeight(_,[],0,0).
pathWeight(_,[_],W,W). 
pathWeight(_,[P1,P2|R],W,Weight):- connection(P1,P2,Dist), 
    CurrDist is W + Dist, pathWeight(_,[P2|R],CurrDist,Weight).
    


sortByDist(L,OL):- mergeSort(L,OL).
mergeSort([],[]).
mergeSort([E],[E]).
mergeSort(Lista, ListaOrdenada) :- separate(Lista,Ll,Lr), mergeSort(Lr, LrF), mergeSort(Ll,LlF),join(LlF, LrF, ListaOrdenada),!.
separate([],[],[]).
separate([E],[E],[]).
separate([C,E|R],[C|L1],[E|L2]):- separate(R,L1,L2).
join(L,[],L).
join([],L,L).
join([A1/A2/A3|R1],[B1/B2/B3|R2] ,[A1/A2/A3|Lf]) :- A3 =< B3, join(R1,[B1/B2/B3|R2],Lf).
join(L,[C2|R2] ,[C2|Lf]) :- join(R2,L,Lf).


