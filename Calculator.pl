%calculates with any simple operation, or combination of simple operations.
calculator(Result):- read(In),calculate(In,Result).
calculate(X + Y, R):- R is X + Y.
calculate(X - Y, R):- R is X - Y.
calculate(X * Y, R):- R is X * Y.
calculate(X / Y, R):- R is X / Y.
calculate(X ^ Y, R):- R is X ^ Y.
