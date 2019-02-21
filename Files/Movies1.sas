/*
Where movie is Released
Vote_average is >= 5
Vote_count is >= 500
Release_date is after 01 Jan 1980
Clean up the genres 
Reassign missing or '0' values in the revenue and budget columns
*/
data Movies1;	
	set Movies;

	/*get the movies with these conditions*/
	where status like 'Released' 
		and vote_average >= 5. 
		and vote_count >= 500. 
		and release_date > '01JAN1980'd;
	
	/*initialize the newGenres, revenue, and budget columns to character*/
	length newGenres $200;
	tempBudget=put(budget, 20.);
	tempRevenue=put(revenue, 20.);
	gCount=count(genres, '{'); *count the brackets;

	do i = 1 to gCount; *run 1 to total brackets;
		/*scan genres and pull out the 6*nth word delimitted by " and then concatenate the strings with a , delimiter*/
		tempGenres=scan(genres, 6*i, '"');
		newGenres=catx(', ', tempGenres, newGenres);
	end;
	
	/*if the budget or revenue values are 0 or missing then it's not available*/
	if tempBudget = 0 or tempBudget = . then tempBudget = 'Not Available';
	if tempRevenue = 0 or tempRevenue = . then tempRevenue = 'Not Available';
	if(title= ' ') then title = original_title;
	

	/*drop and rename for the correct titles*/
	drop genres tempGenres gCount i budget revenue;
	rename newGenres=genres tempBudget=budget tempRevenue=revenue;
run;