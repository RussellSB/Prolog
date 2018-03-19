/*
Question 2.
Russell Sammut Bonnici
ICS1015
*/


/* Question 2a. */

%predicate that binds the sum of the three numbers in Ratio to Sum
sumOfRatios(Ratio,Sum):-
	Ratio = ratio([X,Y,Z]), %to access values in list
	Sum is X+Y+Z. %calculate sum and append

/* Question 2b. */

%base cases (note: this is Stein's Algorithm)
gcd(0,B,D):- 
	D is B.
gcd(A,0,D):- 
	D is A.
%first recursive predicate to get gcd of 2 elements, when B>A
gcd(A,B,D):- 
	A>B,
	ArB is A mod B,
	gcd(ArB,B,D).
%second recursive predicate to get gcd of 2 elements, when A>B
gcd(A,B,D):- 
	A<B,
	BrA is B mod A,
	gcd(A,BrA,D).

%predicate that reduces ratio and binds to FinalRatio
reduceRatio(OriginalRatio,FinalRatio) :-	
	OriginalRatio = ratio([X,Y,Z]), %to access numbers from ratio
	FinalRatio = ratio([X1,Y1,Z1]), %to return after calculated
	gcd(X,Y,D), %find gcd of first two number
	gcd(D,Z,D1), %find gcd of all three numbers
	X1 is X/D1, Y1 is Y/D1, Z1 is Z/D1. %simplifies by dividing by gcd

/* Question 2c. */

%predicate that splits amounts into parts by ratio and binds to Parts
divideRatio(Amount,Ratio,Parts) :-	Parts = ratio([X1,Y1,Z1]),
						reduceRatio(Ratio,FinalRatio),
						sumOfRatios(FinalRatio,S),
						FinalRatio = ratio([X,Y,Z]),
						X1 is X/S*Amount,	
						Y1 is Y/S*Amount,
						Z1 is Z/S*Amount.
						
							






