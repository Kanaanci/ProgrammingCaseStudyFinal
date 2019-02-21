/*seperate output individual genres for each movie*/
data Genre_split;
	retain newgenres title runtime;	
	set Movies;

	/*get the movies with these conditions*/
	where status like 'Released' 
		and vote_average >= 5. 
		and vote_count >= 500. 
		and release_date > '01JAN1980'd;

	length newGenres $200; *new column;
	gCount=count(genres, '{'); *bracket count;

	do i = 1 to gCount; *1 to number of brackets;
		/*scan genres and pull out the 6*nth word*/
		newGenres=scan(genres, 6*i, '"');	
		output;
	end;

	keep newGenres title runtime;
	rename newGenres=genres;
run;
