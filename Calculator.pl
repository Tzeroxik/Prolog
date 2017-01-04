%calculates with any basic arithmetic operation, or combination of basic operations (and powers).
calculator(Result):- read(In), calculate(In,Result).
calculate(X + Y, R):- R is X + Y,!.
calculate(X - Y, R):- R is X - Y,!.
calculate(X * Y, R):- R is X * Y,!. 
calculate(X / Y, R):- R is X / Y,!. 
calculate(X ^ Y, R):- R is X ^ Y,!.
calculate(X, X).
