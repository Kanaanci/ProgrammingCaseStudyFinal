/*Create the final Oscars table where the year is greater than or equal to 1980*/
data Oscars2;
	set Oscars1;

	keep film name award winner;
	rename film=title;
run;

proc sort data=Oscars2 out=Oscars2;
	by title;
run;