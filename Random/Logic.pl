%%%%%%%%%%%%%%%%%%%%%% LOGIC GATES %%%%%%%%%%%%%%%%%%%%%%%%%%
%inverter(+Input, -Output)
inverter(0, 1).
inverter(1, 0).

%and_gate(+Input1, +Input2, -Output)
and_gate(1, 1, 1).
and_gate(_, _, 0).

%or_gate(+Input1,+Input2,-Output
or_gate(0, 0, 0).
or_gate(_, _, 1).

%xor_gate(+Input1, +Input2, -Output)
xor_gate(X, X, 0).
xor_gate(_, _, 1).


%nand_gate(+Input1, +Input2, -Output)
nand_gate(In1, In2, Out) :-
    and_gate(In1, In2, OutAnd),
    !,
    inverter(OutAnd, Out).

%nor_gate(+Input1, +Input2, -Output)
nor_gate(In1, In2, Out) :-
	or_gate(In1, In2, OutOr),
    !,
    inverter(OutOr, Out).

%xnor_gate(+Input1, +Input2, -Output)
xnor_gate(In1, In2, Out) :-
	xor_gate(In1, In2, OutXor),
    !,
    inverter(OutXor, Out).

%%%%%%%%%%%%%%%%%%%%%%%%% N INPUT GATES %%%%%%%%%%%%%%%%%%%%%%%%%%

%nInputXor(+InputList, 0,-Output)
nInputXor([], Output, Output).
nInputXor([A | T], Acc, Output) :- 
    xor_gate(A, Acc, O),
    !, 
    nInputXor(T, O, Output).

%nInputOr(+InputList ,-Output)
nInputOr([], 0) :- !.
nInputOr([1 | _], 1) :- !.
nInputOr([_ | T], Output) :- nInputOr(T, Output).

%nInputAnd(+InputList ,-Output)
nInputAnd([], 1) :- !.
nInputAnd([0 | _],0) :- !.
nInputAnd([_ | T], Output) :- nInputAnd(T, Output).

%%%%%%%%%%%%%%%%%%%%%%% ARITMETIC BLOCKS %%%%%%%%%%%%%%%%%%%%%%%%%%%

%half_adder(+In1,+In2,-Carry,-Sum)
half_adder(In1, In2, Carry, Sum) :-
    xor_gate(In1, In2, Sum),
    and_gate(In1, In2, Carry),
    !.

%full_adder(+Cin, +In1, +In2, -Cout, -Result)
full_adder(Cin, In1, In2, Cout, Result) :-
    half_adder(In1, In2, C1, R1),
    half_adder(R1, Cin, C2, Result),
    or_gate(C1, C2, Cout),
    !.

%%%%%%%%%%%%%%%%%%%%%%%% DEC RESULT FULL_ADDER %%%%%%%%%%%%%%%%%
%def_adder(+Cin, +In1, +In2, -Res)
drf_adder(Cin, In1, In2, Res) :- 
    full_adder(Cin, In1, In2, Cout, Result),
    bin2Int([Cout, Result],Res).

%%%%%%%%%%%%%%%%%%%%%%%% CONVERTERS %%%%%%%%%%%%%%%%%%%%%%%
bin2Int(BinList, Int) :-  
   	sizeof(BinList,0,Size),
    convert(BinList,Size,0,Int),
    !.

sizeof([],Acc,Acc).
sizeof([_|R],Acc,Res) :- 
    Nsize is Acc + 1,
    !, 
    sizeof(R,Nsize,Res). 

convert([],_,Int,Int).
convert([Curr|Tail],Size, Acc, Int) :- 
    Nacc is Acc + (Curr * (2 ^ (Size-1))),
    S is Size - 1,
    !,
    convert(Tail, S, Nacc, Int).
    



