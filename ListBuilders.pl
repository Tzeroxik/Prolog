%(1)% Creates a list with [Min, Max] domain, with the following sequence (Min,Min+1,Min+2,...,Max). 
intListFromRange(Min,Max,List):- 
    addElement(Min,Max,[Min],List).
addElement(N,N,List,List):-!.
addElement(Min,Max,List,ListF):- 
    Min < Max ,N is Min+1,
    append(List,[N],ListN),
    addElement(N,Max,ListN,ListF).


%(2)% Creates any number of random int lists with [0, RN] domain.
createRIL(List):- 
    read(X), % with userInput
    randomIntList(X,List). 
randomIntList(RN,List) :- 
    random(X),
    setNumberRange(X,RN,Range), 
    addElement(0,Range,RN,[],List).
addElement(N,R,RN,_,List) :- 
    N > R, randomIntList(RN,List).
addElement(N,R,_,List,List) :- 
    N =:= R.
addElement(N,R,RN,List,FList) :- 
    N1 is N+1, 
    random(X),setNumberRange(X,RN,E) ,
    append(List,[E],NList), 
    addElement(N1,R,RN,NList,FList).
setNumberRange(X,R,Y):- 
    N is R * X, 
    Y is round(N). 
