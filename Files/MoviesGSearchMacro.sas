/*macro to report movies that have all entered genres*/
/*user may enter up to 3 genres to search, input case does not matter, taken care of in the where statements*/
%macro genre_search(genre1=, genre2=,  genre3=);
	proc report data=Movies3;
	/*if the user only entered a value for genre1*/
	%if(&genre2= and &genre3= ) %then
		where lowcase(genres) like lowcase("%nrstr(%%)&genre1%nrstr(%%)")%nrstr(;);
	/*if the user only entered values for genre1&2*/
	%else %if(&genre3= ) %then
		where lowcase(genres) like lowcase("%nrstr(%%)&genre1%nrstr(%%)")
			and lowcase(genres) like lowcase("%nrstr(%%)&genre2%nrstr(%%)")%nrstr(;);
	/*if all 3 genres were entered*/
	%else 
		where lowcase(genres) like lowcase("%nrstr(%%)&genre1%nrstr(%%)")
			and lowcase(genres) like lowcase("%nrstr(%%)&genre2%nrstr(%%)")
			and lowcase(genres) like lowcase("%nrstr(%%)&genre3%nrstr(%%)")%nrstr(;);

	run;
%mend;