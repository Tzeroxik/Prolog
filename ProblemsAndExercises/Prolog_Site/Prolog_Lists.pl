% List problems from: https://sites.google.com/site/prologsite/prolog-problems/1

% 1.1
findLast([X],X):-!.
findLast([_|T],E):-findLast(T,E).

% 1.2
findLastButOne([C,_],C):-!.
findLastButOne([_|T],E):-findLastButOne(T,E).

% 1.3
%TODO

% 1.4
numberOfElements([],0):-!.
numberOfElements([_|R],Total):-numberOfElements(R,N), Total is N + 1.
