/*
Question 1.
Russell Sammut Bonnici
ICS1015
*/

/*fact*/
secret_word([h,e,l,l,o]).

/*initiating predicate*/
start :- 	
	C is 1, %initialises count
	repeat, %beginning of loop
	write('Guess the first letter'),read(H), %prompts user 
	( secret_word([H|T])->write('OK. '),letter(T,C); %succeeds, go to second letter
	fail ). %fails, loops to repeat function

/*base case*/
letter([],5):- 
	write('Congratulations! The word is '),secret_word(Y),write(Y),nl,!. %congratulate user and finish

/*recursive predicate*/
letter(X,C):-	
	C1 is C+1, %increments count
	repeat, %beginning of loop
	write('Letter #'),write(C1),read(H), %prompts user
	((X=[H|T])->write('OK. '),letter(T,C1); %succeeds, go to next step
	write('Fail. try again! '),fail ). %fails, loops to repeat function
