/*
Question 3.
Russell Sammut Bonnici
ICS1015
*/

/* Question 3a. */

%base cases
permute([],[]). %used for when the inputted list is empty
permute([X],[X]):-!. %copies last element of list to X
%recursive predicate that returns a list's permutations
permute([H|T],Permutation) :- 
	permute(T,X), %uses recursion until base case
	append(L,P2,X), %splits X into P2 and L
	append(L,[H],P1), %appends L and [H] to get P1
	append(P1,P2,Permutation). %appends P1 and P2 for Permutation

/* refer to report for 3b */

/* Question 3c. */

%predicate that returns all the anagagrams in a list
anagram(L,AnagramList) :- 
	findall(Anagram,permute(L,Anagram),AnagramList). %returns AnagramList

/* Question 3d. */

%base cases
sorted([]).
sorted([_]). 
%predicate that succeeds when numbers are in order
sorted([H1,H2|T])  :-	
	H1 =< H2,
	sorted([H2|T]).
			

/* Question 3e. */

%predicate that sorts list
nSort(L,Permutation) :-
	permute(L,Permutation), %returns permutation of list that is sorted
	sorted(Permutation),
	!.

