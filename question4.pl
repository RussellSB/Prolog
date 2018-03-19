/*
Question 4.
Russell Sammut Bonnici
ICS1015
*/

/* Question 4a. */

%knowledge base
word(astante, a,s,t,a,n,t,e).
word(astoria, a,s,t,o,r,i,a).
word(baratto, b,a,r,a,t,t,o).
word(cobalto, c,o,b,a,l,t,o).
word(pistola, p,i,s,t,o,l,a).
word(statale, s,t,a,t,a,l,e).

%predicate that gives solutions on how to fill the grid
crossword(V1,V2,V3,H1,H2,H3)   :-	
	word(V1, _,V1xL2,_,V1xL4,_,V1xL6,_),
	word(V2, _,V2xL2,_,V2xL4,_,V2xL6,_),
	word(V3, _,V3xL2,_,V3xL4,_,V3xL6,_),
	word(H1, _,V1xL2,_,V2xL2,_,V3xL2,_),
	word(H2, _,V1xL4,_,V2xL4,_,V3xL4,_),
	word(H3, _,V1xL6,_,V2xL6,_,V3xL6,_).

/* Question 4b. */

%base case
move1(1,Start,Goal,_) :-
	write('Move disk from '),
	write(Start),
	write(' to '),
	write(Goal),
	nl.

%recursive predicate
move1(N,Start,Goal,Temp) :-
	N>1,
	M is N-1,
	move1(M,Start,Temp,Goal),
	move1(1,Start,Goal,_),
	move1(M,Temp,Goal,Start).
