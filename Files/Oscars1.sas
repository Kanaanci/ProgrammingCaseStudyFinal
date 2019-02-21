/*Create the final Oscars table where the year is greater than or equal to 1980*/
data Oscars1;
	set Oscars;
	where year >= 1980;

	if award in('Actor' 'Actress' 'Actor in a Leading Role' 'Actor in a Supporting Role' 'Actress in a Leading Role' 'Actress in a Supporting Role'
				'Best Picture' 'Award of Commendation' 'Gordon E. Sawyer Award' 'Honorary Award' ' Irving G. Thalberg Memorial Award'
				'Jean Hersholt Humanitarian Award' 'John A. Bonner Medal of Commendation') 
		then do; 
		     temp=name;
			 name=film;
			 film=temp;
		end;
	else do;
		name=name;
		film=film;
	end;
	drop temp;
run;