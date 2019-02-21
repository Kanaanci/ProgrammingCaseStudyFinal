/*
Pull the prouction countries and clean the data
This is not required but completed anyways
*/

data Movies3;
	set Movies2;

	length newCountries $200; *initialize as character so doesn't default to numeric;
	pcCount=count(production_countries, '{'); *count how many brackets;

	/*run a loop from 1 to the number of { to get the 8*nth word*/
	do i = 1 to pcCount;
		tempCountries=scan(production_countries, 8 * i, '"');
		newCountries=catx(', ', newCountries, tempCountries);
	end;

	/*drop and rename appropriately*/
	drop production_countries tempCountries pcCount i;
	rename newCountries=production_countries;
run;